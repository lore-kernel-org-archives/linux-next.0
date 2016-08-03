From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: powerpc allyesconfig / allmodconfig linux-next next-20160729 -
 next-20160729 build failures
Date: Wed, 03 Aug 2016 12:46:47 +1000
Message-ID: <87y44elgbs.fsf@concordia.ellerman.id.au>
References: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <CAB=NE6U18jv89pxqAeZY8eTj44mq90kyXGaQO-108+ZMTyxQiQ@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>, linuxppc-dev@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>
List-Id: linux-next.vger.kernel.org

Ikx1aXMgUi4gUm9kcmlndWV6IiA8bWNncm9mQGtlcm5lbC5vcmc+IHdyaXRlczoKCj4gQXJlIGxp
bnV4LW5leHQgYnVpbGRzIGJlaW5nIHRlc3RlZCBmb3IgcG93ZXJwYyB3aXRoIGFsbHllc2NvbmZp
ZyBhbmQKPiBhbGxtb2Rjb25maWcgPwoKWWVzLCBldmVyeSBzaW5nbGUgdmVyc2lvbjoKCiAgaHR0
cDovL2tpc3NrYi5lbGxlcm1hbi5pZC5hdS9raXNza2IvdGFyZ2V0LzI2NTkvCgo+IEkgaGF2ZSBz
b21lIGNoYW5nZXMgSSdtIG1ha2luZyBhbmQgd2hpbGUgZGVidWdnaW5nIG15Cj4gYnVpbGQgaXNz
dWVzIEkgZGVjaWRlZCB0byBnaXZlIGEgY2xlYW4gYnVpbGQgYSBzaG90IGFuZCBzZWUgbGludXgt
bmV4dAo+IG5leHQtMjAxNjA3MjkgdXAgdG8gbmV4dC0yMDE2MDcyOSBhbGwgaGF2ZSBidWlsZCBm
YWlsdXJlcyB3aXRob3V0IG15Cj4gY2hhbmdlcy4gSSBnZXQ6Cj4KPiAvb3B0L2djYy00LjkuMC1u
b2xpYmMvcG93ZXJwYzY0LWxpbnV4L2Jpbi9wb3dlcnBjNjQtbGludXgtbGQ6Cj4gZHJpdmVycy9i
dWlsdC1pbi5vOiAub3BkIGlzIG5vdCBhIHJlZ3VsYXIgYXJyYXkgb2Ygb3BkIGVudHJpZXMKPiAg
IE1PRFBPU1Qgdm1saW51eC5vCj4gICBHRU4gICAgIC52ZXJzaW9uCj4gICBDSEsgICAgIGluY2x1
ZGUvZ2VuZXJhdGVkL2NvbXBpbGUuaAo+ICAgVVBEICAgICBpbmNsdWRlL2dlbmVyYXRlZC9jb21w
aWxlLmgKPiAgIENDICAgICAgaW5pdC92ZXJzaW9uLm8KPiAgIExEICAgICAgaW5pdC9idWlsdC1p
bi5vCj4gL29wdC9nY2MtNC45LjAtbm9saWJjL3Bvd2VycGM2NC1saW51eC9iaW4vcG93ZXJwYzY0
LWxpbnV4LWxkOgo+IGRyaXZlcnMvYnVpbHQtaW4ubzogLm9wZCBpcyBub3QgYSByZWd1bGFyIGFy
cmF5IG9mIG9wZCBlbnRyaWVzCj4gZHJpdmVycy9idWlsdC1pbi5vOiBJbiBmdW5jdGlvbiBgLmlw
dzIxMDBfdXAnOgo+IGlwdzIxMDAuYzooLnRleHQrMHgxZmY5YzkwKTogcmVsb2NhdGlvbiB0cnVu
Y2F0ZWQgdG8gZml0Ogo+IFJfUFBDNjRfUkVMMjQgKHN0dWIpIGFnYWluc3Qgc3ltYm9sIGAucm91
bmRfamlmZmllc19yZWxhdGl2ZScgZGVmaW5lZAo+IGluIC50ZXh0IHNlY3Rpb24gaW4ga2VybmVs
L2J1aWx0LWluLm8KCkFuZCB5ZXMgdGhpcyBpcyBhIGtub3duIHByb2JsZW0sIHRoZXJlIGhhdmUg
YmVlbiBhdHRlbXB0cyB0byBmaXggaXQsIGJ1dApub25lIHRoYXQgcXVpdGUgZ290IHdvcmtpbmcu
CgpJbiBmYWN0IGl0J3Mgb3VyIGJ1ZyAjMSA6KQoKICBodHRwczovL2dpdGh1Yi5jb20vbGludXhw
cGMvbGludXgvaXNzdWVzLzEKCgpQbGVhc2UgdXNlIGFsbG1vZGNvbmZpZywgd2hpY2ggc2hvdWxk
IGJ1aWxkIGluIGdlbmVyYWwuIE9yIG9uZSBvZiBvdXIKb3RoZXIgZGVmY29uZmlncywgZWcuIHBw
YzY0L3BwYzY0bGUgZGVmY29uZmlnLgoKY2hlZXJzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4cHBjLWRldiBtYWlsaW5nIGxpc3QKTGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcKaHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL2xpc3RpbmZvL2xp
bnV4cHBjLWRldg==
