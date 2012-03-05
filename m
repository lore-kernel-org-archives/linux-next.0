From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: linux-next: build failure after merge of the cpufreq tree
Date: Mon, 05 Mar 2012 01:46:07 +0000 (GMT)
Message-ID: <13197479.540821330911965933.JavaMail.weblogic@epv6ml06>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset=euc-kr
Content-Transfer-Encoding: base64
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37430 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755065Ab2CEBqO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 4 Mar 2012 20:46:14 -0500
Received: from epcpsbge5.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0E009PD290Y220@mailout1.samsung.com> for
 linux-next@vger.kernel.org; Mon, 05 Mar 2012 10:46:13 +0900 (KST)
MIME-version: 1.0
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Jones <davej@redhat.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?euc-kr?Q?=B9=DA=B0=E6=B9=CE?= <kyungmin.park@samsung.com>, "RafaelJ.Wysocki<rjw"@sisk.pl, linux-pm@vger.kernel.org

SGVsbG8sDQoNClRoZSBwYXRjaCAiQ1BVZnJlcSBvbmRlbWFuZDogaGFuZGxlIFFvUyByZXF1ZXN0
IG9uIERWRlMgcmVzcG9uc2UgbGF0ZW5jeSIgdGhhdCBpbnRyb2R1Y2VkIHRoZSBtZW50aW9uZWQg
ZXJyb3JzIHJlcXVpcmVzIHRoZSBwYXRjaCAiUE0gLyBRb1M6IEludHJvZHVjZSBuZXcgY2xhc3Nl
czogRE1BLVRocm91Z2hwdXQgYW5kIERWRlMtTGF0ZW5jeSIgZ2V0IG1lcmdlZCwgdG9vLiBJIGd1
ZXNzIHRoYXQgcGF0Y2ggd2lsbCBiZSBhdCBwbS1xb3MgdHJlZSBpZiBnZXQgbWVyZ2VkICh2MiBw
YXRjaCBoYXMgYmVlbiByZWxlYXNlZCA3IGRheXMgYWdvKS4NCg0KDQpDaGVlcnMhDQpNeXVuZ0pv
by4NCg0KLS0tLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tLS0NClNlbmRlciA6IFN0ZXBoZW4g
Um90aHdlbGw8c2ZyQGNhbmIuYXV1Zy5vcmcuYXU+DQpEYXRlIDogMjAxMi0wMy0wMSAxMTo1NiAo
R01UKzA5OjAwKQ0KVGl0bGUgOiBsaW51eC1uZXh0OiBidWlsZCBmYWlsdXJlIGFmdGVyIG1lcmdl
IG9mIHRoZSBjcHVmcmVxIHRyZWUNCg0KSGkgRGF2ZSwNCg0KQWZ0ZXIgbWVyZ2luZyB0aGUgY3B1
ZnJlcSB0cmVlLCB0b2RheSdzIGxpbnV4LW5leHQgYnVpbGQgKHg4Nl82NA0KYWxsbW9kY29uZmln
KSBmYWlsZWQgbGlrZSB0aGlzOg0KDQpkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5j
OiBJbiBmdW5jdGlvbiAnY3B1ZnJlcV9nb3ZfZGJzX2luaXQnOg0KZHJpdmVycy9jcHVmcmVxL2Nw
dWZyZXFfb25kZW1hbmQuYzo4ODA6Mjg6IGVycm9yOiAnUE1fUU9TX0RWRlNfUkVTUE9OU0VfTEFU
RU5DWScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pDQpkcml2ZXJzL2Nw
dWZyZXEvY3B1ZnJlcV9vbmRlbWFuZC5jOiBJbiBmdW5jdGlvbiAnY3B1ZnJlcV9nb3ZfZGJzX2V4
aXQnOg0KZHJpdmVycy9jcHVmcmVxL2NwdWZyZXFfb25kZW1hbmQuYzo4OTY6MjU6IGVycm9yOiAn
UE1fUU9TX0RWRlNfUkVTUE9OU0VfTEFURU5DWScgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pDQoNCkNhdXNlZCBieSBjb21taXQgNTAwZThjYTM5YzU2ICgiW0NQVUZSRVFd
IG9uZGVtYW5kOiBoYW5kbGUgUW9TIHJlcXVlc3Qgb24NCkRWRlMgcmVzcG9uc2UgbGF0ZW5jeSIp
Lg0KDQpJIGhhdmUgdXNlZCB0aGUgY3B1ZnJlcSB0cmVlIGZvbXIgbmV4dC0yMDEyMDIyOSBmb3Ig
dG9kYXkuDQotLSANCkNoZWVycywNClN0ZXBoZW4gUm90aHdlbGwgICAgICAgICAgICAgICAgICAg
IHNmckBjYW5iLmF1dWcub3JnLmF1DQpodHRwOi8vd3d3LmNhbmIuYXV1Zy5vcmcuYXUvfnNmci8N
Cg0KDQoNCi0tDQpNeXVuZ0pvbyBIYW0gKMfUuO3B1iksIFBIRA0KU3lzdGVtIFMvVyBMYWIsIFMv
VyBQbGF0Zm9ybSBUZWFtLCBTb2Z0d2FyZSBDZW50ZXINClNhbXN1bmcgRWxlY3Ryb25pY3MNCkNl
bGw6ICs4Mi0xMC02NzE0LTI4NTg=
