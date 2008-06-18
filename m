From: Trond Myklebust <trond.myklebust@fys.uio.no>
Subject: Re: linux-next: nfs build failure
Date: Wed, 18 Jun 2008 16:14:02 -0400
Message-ID: <1213820042.8233.21.camel@localhost>
References: <20080618125213.30382b62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-YY+Hb/Gzo4YEAwyAoiPS"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-out1.uio.no ([129.240.10.57]:59449 "EHLO mail-out1.uio.no"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751398AbYFRUOI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Jun 2008 16:14:08 -0400
In-Reply-To: <20080618125213.30382b62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>


--=-YY+Hb/Gzo4YEAwyAoiPS
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-06-18 at 12:52 +1000, Stephen Rothwell wrote:
> Hi Trond,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/built-in.o: In function `.nfs_parse_ip_address':
> super.c:(.text+0xe2f08): undefined reference to `.__ipv6_addr_type'
> 
> Some CONFIG_IPV6 protections are needed ...
> 
> I reverted commit 09491a874d4f9a8676567bc58bce9dec9539740d ("NFS: handle
> interface identifiers in incoming IPv6 addresses").

I suggest something like the attached patch. Comments Chuck?

Trond



--=-YY+Hb/Gzo4YEAwyAoiPS
Content-Disposition: inline; filename=linux-2.6.26-023-dont_parse_ipv6_if_no_config_ipv6.dif
Content-Type: message/rfc822; name=linux-2.6.26-023-dont_parse_ipv6_if_no_config_ipv6.dif

From: Trond Myklebust <Trond.Myklebust@netapp.com>
Date: Wed, 18 Jun 2008 16:04:22 -0400
Subject: NFS: Don't allow IPv6 addresses if CONFIG_IPv6 isn't set
Message-Id: <1213820042.8233.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: base64

Rml4ZXMgYSBjb21waWxlIGZhaWx1cmUgaW4gZnMvbmZzL3N1cGVyLmMKCkFsc28gZml4IHRoZSBj
b21waWxlciB3YXJuaW5nczoKICBmcy9uZnMvc3VwZXIuYzo3MjE6IHdhcm5pbmc6IGZpZWxkIHdp
ZHRoIHNob3VsZCBoYXZlIHR5cGUg4oCYaW504oCZLCBidXQKICAJCSAgICAgIGFyZ3VtZW50IDIg
aGFzIHR5cGUg4oCYc2l6ZV904oCZCiAgZnMvbmZzL3N1cGVyLmM6ODA5OjM6IHdhcm5pbmc6IHJl
dHVybmluZyB2b2lkLXZhbHVlZCBleHByZXNzaW9uCiAgZnMvbmZzL3N1cGVyLmM6ODExOjM6IHdh
cm5pbmc6IHJldHVybmluZyB2b2lkLXZhbHVlZCBleHByZXNzaW9uCgpTaWduZWQtb2ZmLWJ5OiBU
cm9uZCBNeWtsZWJ1c3QgPFRyb25kLk15a2xlYnVzdEBuZXRhcHAuY29tPgotLS0KCiBmcy9uZnMv
c3VwZXIuYyB8ICAgMTkgKysrKysrKysrKysrKystLS0tLQogMSBmaWxlcyBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL25mcy9zdXBlci5j
IGIvZnMvbmZzL3N1cGVyLmMKaW5kZXggZTYyODIwYy4uNmE0N2JjMyAxMDA2NDQKLS0tIGEvZnMv
bmZzL3N1cGVyLmMKKysrIGIvZnMvbmZzL3N1cGVyLmMKQEAgLTcxOCwxMCArNzE4LDEwIEBAIHN0
YXRpYyB2b2lkIG5mc19wYXJzZV9pcHY0X2FkZHJlc3MoY2hhciAqc3RyaW5nLCBzaXplX3Qgc3Ry
X2xlbiwKIAlzdHJ1Y3Qgc29ja2FkZHJfaW4gKnNpbiA9IChzdHJ1Y3Qgc29ja2FkZHJfaW4gKilz
YXA7CiAJdTggKmFkZHIgPSAodTggKikmc2luLT5zaW5fYWRkci5zX2FkZHI7CiAKLQlkZnByaW50
ayhNT1VOVCwgIk5GUzogcGFyc2luZyBJUHY0IGFkZHJlc3MgJSpzXG4iLAotCQkJc3RyX2xlbiwg
c3RyaW5nKTsKLQogCWlmIChzdHJfbGVuIDw9IElORVRfQUREUlNUUkxFTikgeworCQlkZnByaW50
ayhNT1VOVCwgIk5GUzogcGFyc2luZyBJUHY0IGFkZHJlc3MgJSpzXG4iLAorCQkJCShpbnQpc3Ry
X2xlbiwgc3RyaW5nKTsKKwogCQlzaW4tPnNpbl9mYW1pbHkgPSBBRl9JTkVUOwogCQkqYWRkcl9s
ZW4gPSBzaXplb2YoKnNpbik7CiAJCWlmIChpbjRfcHRvbihzdHJpbmcsIHN0cl9sZW4sIGFkZHIs
ICdcMCcsIE5VTEwpKQpAQCAtNzMyLDYgKzczMiw3IEBAIHN0YXRpYyB2b2lkIG5mc19wYXJzZV9p
cHY0X2FkZHJlc3MoY2hhciAqc3RyaW5nLCBzaXplX3Qgc3RyX2xlbiwKIAkqYWRkcl9sZW4gPSAw
OwogfQogCisjaWZkZWYgQ09ORklHX0lQVjYKIHN0YXRpYyB2b2lkIG5mc19wYXJzZV9pcHY2X3Nj
b3BlX2lkKGNvbnN0IGNoYXIgKnN0cmluZywgY29uc3Qgc2l6ZV90IHN0cl9sZW4sCiAJCQkJICAg
IGNvbnN0IGNoYXIgKmRlbGltLAogCQkJCSAgICBzdHJ1Y3Qgc29ja2FkZHJfaW42ICpzaW42KQpA
QCAtNzg3LDYgKzc4OCwxNCBAQCBzdGF0aWMgdm9pZCBuZnNfcGFyc2VfaXB2Nl9hZGRyZXNzKGNo
YXIgKnN0cmluZywgc2l6ZV90IHN0cl9sZW4sCiAJc2FwLT5zYV9mYW1pbHkgPSBBRl9VTlNQRUM7
CiAJKmFkZHJfbGVuID0gMDsKIH0KKyNlbHNlCitzdGF0aWMgdm9pZCBuZnNfcGFyc2VfaXB2Nl9h
ZGRyZXNzKGNoYXIgKnN0cmluZywgc2l6ZV90IHN0cl9sZW4sCisJCQkJICAgc3RydWN0IHNvY2th
ZGRyICpzYXAsIHNpemVfdCAqYWRkcl9sZW4pCit7CisJc2FwLT5zYV9mYW1pbHkgPSBBRl9VTlNQ
RUM7CisJKmFkZHJfbGVuID0gMDsKK30KKyNlbmRpZgogCiAvKgogICogQ29uc3RydWN0IGEgc29j
a2FkZHIgYmFzZWQgb24gdGhlIGNvbnRlbnRzIG9mIGEgc3RyaW5nIHRoYXQgY29udGFpbnMKQEAg
LTgwNiw5ICs4MTUsOSBAQCBzdGF0aWMgdm9pZCBuZnNfcGFyc2VfaXBfYWRkcmVzcyhjaGFyICpz
dHJpbmcsIHNpemVfdCBzdHJfbGVuLAogCQkJY29sb25zKys7CiAKIAlpZiAoY29sb25zID49IDIp
Ci0JCXJldHVybiBuZnNfcGFyc2VfaXB2Nl9hZGRyZXNzKHN0cmluZywgc3RyX2xlbiwgc2FwLCBh
ZGRyX2xlbik7CisJCW5mc19wYXJzZV9pcHY2X2FkZHJlc3Moc3RyaW5nLCBzdHJfbGVuLCBzYXAs
IGFkZHJfbGVuKTsKIAllbHNlCi0JCXJldHVybiBuZnNfcGFyc2VfaXB2NF9hZGRyZXNzKHN0cmlu
Zywgc3RyX2xlbiwgc2FwLCBhZGRyX2xlbik7CisJCW5mc19wYXJzZV9pcHY0X2FkZHJlc3Moc3Ry
aW5nLCBzdHJfbGVuLCBzYXAsIGFkZHJfbGVuKTsKIH0KIAogLyoK


--=-YY+Hb/Gzo4YEAwyAoiPS--

