@@ -0,0 +1,35 @@
# Copyright © 2020 Nicky Peeters
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

require 'rubygems'
require 'openssl'

key = OpenSSL::PKey::RSA.new(1024)
public_key = key.public_key

subject = "/C=BE/O=Test/OU=Test/CN=Test"

cert = OpenSSL::X509::Certificate.new
cert.subject = cert.issuer = OpenSSL::X509::Name.parse(subject)
cert.not_before = Time.now
cert.not_after = Time.now + 365 * 24 * 60 * 60
cert.public_key = public_key
cert.serial = 0x0
cert.version = 2

ef = OpenSSL::X509::ExtensionFactory.new
ef.subject_certificate = cert
ef.issuer_certificate = cert
cert.extensions = [
  ef.create_extension("basicConstraints","CA:TRUE", true),
  ef.create_extension("subjectKeyIdentifier", "hash"),
  # ef.create_extension("keyUsage", "cRLSign,keyCertSign", true),
]
cert.add_extension ef.create_extension("authorityKeyIdentifier",
                                       "keyid:always,issuer:always")

cert.sign key, OpenSSL::Digest::SHA1.new

puts cert.to_pem