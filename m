From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Tue, 17 Oct 2017 10:11:53 +0200
Message-ID: <CAK8P3a0bz3XzPsso0T-AfiBn7K_wRHauAckt5rB5dmNt4Fa-bw@mail.gmail.com>
References: <20171016113529.ey35y6zwfyhdbvhe@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <20171016113529.ey35y6zwfyhdbvhe@sirena.co.uk>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Mark Brown <broonie@kernel.org>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Daniel Vetter <daniel.vetter@intel.com>, Mika Kuoppala <mika.kuoppala@intel.com>
List-Id: linux-next.vger.kernel.org

T24gTW9uLCBPY3QgMTYsIDIwMTcgYXQgMTozNSBQTSwgTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPiB3cm90ZToKPiBIaSBhbGwsCj4KPiBUb2RheSdzIGxpbnV4LW5leHQgbWVyZ2Ugb2Yg
dGhlIGRybS1pbnRlbCB0cmVlIGdvdCBhIGNvbmZsaWN0IGluOgo+Cj4gICBkcml2ZXJzL2dwdS9k
cm0vaTkxNS9pOTE1X2dlbS5jCj4KPiBiZXR3ZWVuIGNvbW1pdDoKPgo+ICAgYjg1NTc3YjcyODM3
ZSAoImRybS9pOTE1OiBPcmRlciB0d28gY29tcGxldGluZyBub3Bfc3VibWl0X3JlcXVlc3QiKQo+
Cj4gZnJvbSB0aGUgZHJtLWludGVsLWZpeGVzIHRyZWUgYW5kIGNvbW1pdDoKPgo+ICAgNWQwMzFm
NGUxNjE4YiAoImRybS9pOTE1OiBTdG9wIGFzc2VydGluZyBvbiBzZXQtd2VkZ2VkIHZzIG5vcF9z
dWJtaXRfcmVxdWVzdCBvcmRlcmluZyIpCj4KPiBmcm9tIHRoZSBkcm0taW50ZWwgdHJlZS4KPgo+
IEkgZml4ZWQgaXQgdXAgKHNlZSBiZWxvdykgYW5kIGNhbiBjYXJyeSB0aGUgZml4IGFzIG5lY2Vz
c2FyeS4gVGhpcwo+IGlzIG5vdyBmaXhlZCBhcyBmYXIgYXMgbGludXgtbmV4dCBpcyBjb25jZXJu
ZWQsIGJ1dCBhbnkgbm9uIHRyaXZpYWwKPiBjb25mbGljdHMgc2hvdWxkIGJlIG1lbnRpb25lZCB0
byB5b3VyIHVwc3RyZWFtIG1haW50YWluZXIgd2hlbiB5b3VyIHRyZWUKPiBpcyBzdWJtaXR0ZWQg
Zm9yIG1lcmdpbmcuICBZb3UgbWF5IGFsc28gd2FudCB0byBjb25zaWRlciBjb29wZXJhdGluZwo+
IHdpdGggdGhlIG1haW50YWluZXIgb2YgdGhlIGNvbmZsaWN0aW5nIHRyZWUgdG8gbWluaW1pc2Ug
YW55IHBhcnRpY3VsYXJseQo+IGNvbXBsZXggY29uZmxpY3RzLgoKVGhpcyBtZXJnZSBzZWVtcyBm
aW5lLCBidXQgaXQgc2VlbXMgdGhlcmUgd2FzIGFub3RoZXIgbWVyZ2UKYWdhaW5zdCB0aGUgYWtw
bSB0cmVlIHRoYXQgaW50cm9kdWNlZCBhIGJ1aWxkIGVycm9yIGJ5IHJlaW50cm9kdWNpbmcKdGhl
IHNwaW5fbG9ja19pcnFzYXZlKCkgd2l0aG91dCByZXN0b3JpbmcgdGhlIGxvY2FsIHZhcmlhYmxl
OgoKZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYzogSW4gZnVuY3Rpb24gJ25vcF9zdWJt
aXRfcmVxdWVzdCc6CmRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmM6MzA5Mjo1NDogZXJy
b3I6ICdmbGFncycgdW5kZWNsYXJlZAooZmlyc3QgdXNlIGluIHRoaXMgZnVuY3Rpb24pOyBkaWQg
eW91IG1lYW4gJ2NsYXNzJz8KCkknbGwgc2VuZCBteSBsb2NhbCBidWlsZCBmaXgsIHdoaWNoIG1h
eSBvciBtYXkgbm90IGJlIHRoZSBpbnRlbmRlZApiZWhhdmlvciBidXQgZ2V0cyBpdCB0byBjb21w
aWxlLgoKICAgICAgQXJuZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
