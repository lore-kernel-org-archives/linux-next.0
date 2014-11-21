From: Oded Gabbay <oded.gabbay@amd.com>
Subject: Re: randconfig build error with next-20141121,
 in drivers/gpu/drm/amd/amdkfd/kfd_doorbell.c
Date: Fri, 21 Nov 2014 22:06:46 +0200
Message-ID: <546F9B56.2010900@amd.com>
References: <CA+r1Zhj4+v+ggOhXm_3qz5=d8PgSDRexs1qQB9dk+KOC2TVzMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CA+r1Zhj4+v+ggOhXm_3qz5=d8PgSDRexs1qQB9dk+KOC2TVzMA@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: linux-next.vger.kernel.org

CgpPbiAxMS8yMS8yMDE0IDA3OjA0IFBNLCBKaW0gRGF2aXMgd3JvdGU6Cj4gQnVpbGRpbmcgd2l0
aCB0aGUgYXR0YWNoZWQgcmFuZG9tIGNvbmZpZ3VyYXRpb24gZmlsZSwKPiAKPiBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGtmZC9rZmRfZG9vcmJlbGwuYzogSW4gZnVuY3Rpb24g4oCYa2ZkX2Rvb3Ji
ZWxsX2luaXTigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rvb3JiZWxsLmM6
OTc6MjogZXJyb3I6IGltcGxpY2l0Cj4gZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYaW9yZW1h
cOKAmQo+IFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQo+ICAga2ZkLT5k
b29yYmVsbF9rZXJuZWxfcHRyID0gaW9yZW1hcChrZmQtPmRvb3JiZWxsX2Jhc2UsCj4gICBeCj4g
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2Rvb3JiZWxsLmM6OTc6Mjc6IHdhcm5pbmc6
IGFzc2lnbm1lbnQKPiBtYWtlcyBwb2ludGVyIGZyb20gaW50ZWdlciB3aXRob3V0IGEgY2FzdCBb
ZW5hYmxlZCBieSBkZWZhdWx0XQo+ICAga2ZkLT5kb29yYmVsbF9rZXJuZWxfcHRyID0gaW9yZW1h
cChrZmQtPmRvb3JiZWxsX2Jhc2UsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9kb29yYmVsbC5jOiBJbiBmdW5jdGlvbiDigJh3
cml0ZV9rZXJuZWxfZG9vcmJlbGzigJk6Cj4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2Zk
X2Rvb3JiZWxsLmM6MjE3OjM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZgo+IGZ1bmN0
aW9uIOKAmHdyaXRlbOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0K
PiAgICB3cml0ZWwodmFsdWUsIGRiKTsKPiAgICBeCj4gY2MxOiBzb21lIHdhcm5pbmdzIGJlaW5n
IHRyZWF0ZWQgYXMgZXJyb3JzCj4gbWFrZVs0XTogKioqIFtkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfZG9vcmJlbGwub10gRXJyb3IgMQo+IAoKVGhhbmtzLCBJJ20gbm93IHNlbmRpbmcg
YSBwYXRjaCB0aGF0IGZpeGVzIHRoaXMgcHJvYmxlbS4KCglPZGVkCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
