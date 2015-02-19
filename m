From: Rusty Russell <rusty-8n+1lVoiYb80n/F98K4Iww@public.gmane.org>
Subject: Re: linux-next: Tree for Feb 18 (x86)
Date: Thu, 19 Feb 2015 12:31:05 +1030
Message-ID: <87mw4aslr2.fsf@rustcorp.com.au>
References: <20150218142237.2cc68be5@canb.auug.org.au>
 <54E4DE1C.1020503@infradead.org> <54E51603.8040601@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <lguest-bounces+glkvl-lguest=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <54E51603.8040601-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/lguest>,
 <mailto:lguest-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/lguest/>
List-Post: <mailto:lguest-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:lguest-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/lguest>,
 <mailto:lguest-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: lguest-bounces+glkvl-lguest=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "Lguest" <lguest-bounces+glkvl-lguest=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lguest-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, X86 ML <x86-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

UmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IHdyaXRlczoKPiBPbiAwMi8xOC8x
NSAxMDo0NiwgUmFuZHkgRHVubGFwIHdyb3RlOgo+PiBPbiAwMi8xNy8xNSAxOToyMiwgU3RlcGhl
biBSb3Rod2VsbCB3cm90ZToKPj4+IEhpIGFsbCwKPj4+Cj4+PiBQbGVhc2UgZG8gbm90IGFkZCBh
bnkgbWF0ZXJpYWwgZGVzdGluZWQgZm9yIHYzLjIxIHRvIHlvdXIgbGludXgtbmV4dAo+Pj4gaW5j
bHVkZWQgdHJlZXMgdW50aWwgYWZ0ZXIgdjMuMjAtcmMxIGhhcyBiZWVuIHJlbGVhc2VkLgo+Pj4K
Pj4+IENoYW5nZXMgc2luY2UgMjAxNTAyMTc6Cj4+Pgo+PiAKPj4gCj4+IG9uIGkzODYsIHdoZW4g
Q09ORklHX1BDSSBpcyBub3QgZW5hYmxlZDoKPgo+IFRoaXMgaXMgYWxsIGxndWVzdC1yZWxhdGVk
LiAgTG9va3MgbGlrZSBMR1VFU1RfR1VFU1Qgc2hvdWxkIGFsc28KPiBkZXBlbmQgb24gUENJIChp
biBhcmNoL3g4Ni9sZ3Vlc3QvS2NvbmZpZykuCgpJJ3ZlIGNvbW1pdHRlZCB0aGlzIHRvIG15IGZp
eGVzIGJyYW5jaC4KClRoYW5rcywKUnVzdHkuCgpsZ3Vlc3Q6IG5vdyBkZXBlbmRzIG9uIFBDSQoK
UmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPgpTaWduZWQt
b2ZmLWJ5OiBSdXN0eSBSdXNzZWxsIDxydXN0eUBydXN0Y29ycC5jb20uYXU+CgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvbGd1ZXN0L0tjb25maWcgYi9hcmNoL3g4Ni9sZ3Vlc3QvS2NvbmZpZwppbmRl
eCA0YTA4OTBmODE1YzQuLjIxZTg5ODA3MjQ0YyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvbGd1ZXN0
L0tjb25maWcKKysrIGIvYXJjaC94ODYvbGd1ZXN0L0tjb25maWcKQEAgLTEsNiArMSw2IEBACiBj
b25maWcgTEdVRVNUX0dVRVNUCiAJYm9vbCAiTGd1ZXN0IGd1ZXN0IHN1cHBvcnQiCi0JZGVwZW5k
cyBvbiBYODZfMzIgJiYgUEFSQVZJUlQKKwlkZXBlbmRzIG9uIFg4Nl8zMiAmJiBQQVJBVklSVCAm
JiBQQ0kKIAlzZWxlY3QgVFRZCiAJc2VsZWN0IFZJUlRVQUxJWkFUSU9OCiAJc2VsZWN0IFZJUlRJ
TwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMZ3Vlc3Qg
bWFpbGluZyBsaXN0CkxndWVzdEBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9sZ3Vlc3QK
