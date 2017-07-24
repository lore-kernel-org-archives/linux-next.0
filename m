From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: build failure after merge of the
	drm-misc tree
Date: Mon, 24 Jul 2017 11:33:28 -0700
Message-ID: <20170724183328.GA7564@kroah.com>
References: <20170719114657.245537cd@canb.auug.org.au>
 <20170721100833.48c8fa9d@canb.auug.org.au>
 <CAKMK7uHLY7jriTrZpxRFbjVf2mbdHymMw6HpW0NS0azf7Ea4Yw@mail.gmail.com>
 <20170724100341.7c4c5e33@canb.auug.org.au>
 <CAKMK7uGWiVS_dX1VUaN9qUKK2x+u0a0P6M56dbwHzaiYht2ahA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGWiVS_dX1VUaN9qUKK2x+u0a0P6M56dbwHzaiYht2ahA@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Linux-Next Mailing List <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

T24gTW9uLCBKdWwgMjQsIDIwMTcgYXQgMTA6MjQ6NDFBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBNb24sIEp1bCAyNCwgMjAxNyBhdCAyOjAzIEFNLCBTdGVwaGVuIFJvdGh3ZWxs
IDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4gd3JvdGU6Cj4gPiBIaSBEYW5pZWwsCj4gPgo+ID4gT24g
RnJpLCAyMSBKdWwgMjAxNyAwOToyNDo0OSArMDIwMCBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPiB3cm90ZToKPiA+Pgo+ID4+IEhvdyBhcmUgd2UgZ29pbmcgdG8gaGFuZGxl
IHRoaXMgbm93PyBUaGUgcmVmYWN0b3IgaXMgZGVlcGx5IGJ1cnJpZWQgaW4KPiA+PiBkcm0tbWlz
YywgSSBndWVzcyB5b3UgY291bGQgY2hlcnJ5LXBpY2sgdGhlIHJlbGV2YW50IHBhdGNoZXMgb3Zl
ci4gQnV0Cj4gPj4gdGhhdCdsbCBwcm9iYWJseSBsZWFkIHRvIG1vcmUgY29uZmxpY3RzIGJlY2F1
c2UgZ2l0IHdpbGwgZ2V0IGNvbmZ1c2VkLgo+ID4KPiA+IEknbGwganVzdCBrZWVwIGFwcGx5aW5n
IHRoZSBtZXJnZSByZXNvbHV0aW9uIHBhdGNoIGFuZCB3aWxsIHJlbWluZCBEYXZlCj4gPiBhbmQg
R3JlZyBhYm91dCBpdCBkdXJpbmcgdGhlIHdlZWsgYmVmb3JlIHRoZSBtZXJnZSB3aW5kb3cgb3Bl
bnMgc28gdGhhdAo+ID4gdGhleSBjYW4gbGV0IExpbnVzIGtub3cgdGhhdCB0aGUgZml4IHVwIGlz
IG5lZWRlZC4KPiAKPiBXZWxsLCBHcmVnIHNxdWVlemVkIHRoZSB2Ym94IGRyaXZlciBpbnRvIC1y
YzIsIHNvIG5vdyB3ZSBhbHJlYWR5IGdldAo+IHRvIHJlc29sdmUgdGhpcyBpbiBhIGJhY2ttZXJn
ZS4gQW5kIGhvcGVmdWxseSB0aGUgYmlrZXNoZWQgcGF0Y2hlcyBpbgo+IC1zdGFnaW5nIHdvbid0
IGludGVyZmVyZSB0b28gYmFkbHkgd2l0aCB3aGF0ZXZlciByZWZhY3RvcmluZyB3ZSdsbCBkbwo+
IGluIGRybS1uZXh0Lgo+IAo+IEdyZWcsIGZ5aSB0aGlzIGlzIHRoZSBsYXN0IHRpbWUgSSdsbCBh
Y2sgYSBkcm0gZHJpdmVyIGZvciBzdGFnaW5nLgo+IFRoaXMganVzdCBkb2Vzbid0IHdvcmsuIFdl
J3JlIHNwZW5kaW5nIG1vcmUgdGltZSBoZXJlIHdvcmtpbmcgdGhlCj4gLXN0YWdpbmcgdnMuIGRy
bS1uZXh0IGNvbmZsaWN0cyB0aGFuIHRoZSBhY3R1YWwgdmJveCBkcml2ZXIgcmV2aWV3IGhhcwo+
IHRha2VuIG1lLiBBbmQgcHJvYmx5IGxlc3MgdGhhbiB0aGUgY2xlYW51cCBmb3IgbWVyZ2luZyBk
aXJlY3RseSB0bwo+IGRybS1uZXh0IHdpbGwgZW5kIHVwIHRha2luZy4KCkhleSwgSSB3YXMgYW1h
emVkIHRoYXQgeW91IGFsbCBhY2tlZCBpdCwgYW5kIGl0J3Mgd2h5IEkgcmVxdWlyZWQgdGhhdAp5
b3UgZG8gc28gYmVmb3JlIEkgdG9vayBpdCA6KQoKR29vZCBsdWNrIHdpdGggdGhlIG1lcmdlcyEK
CmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkludGVsLWdmeCBtYWlsaW5nIGxpc3QKSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAo=
