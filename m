From: Daniel Stone <daniels@collabora.com>
Subject: Re: linux-next: problems fetching the drm-intel,
	etc trees
Date: Thu, 01 Dec 2016 11:02:26 +0000
Message-ID: <cdua8dskv8xvorsys9a6z53yl-0@mailer.nylas.com>
References: <20161201093958.3be47944@canb.auug.org.au>
 <CAF6AEGvh0pJcot9_6TESY28f8yZsAyKJfByca2TuhkKpkcxQXw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0150855615=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
In-Reply-To: <CAF6AEGvh0pJcot9_6TESY28f8yZsAyKJfByca2TuhkKpkcxQXw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>
List-Id: linux-next.vger.kernel.org

--===============0150855615==
Content-Type: multipart/alternative; boundary="d5a5553299474dd1b72d81579e508acd"

--d5a5553299474dd1b72d81579e508acd
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="ascii"
Mime-Version: 1.0

Hi guys,  
  

  
On Nov 30 2016, at 10:49 pm, Rob Clark <robdclark@gmail.com> wrote:  

> yeah, {cgit,anongit}.fd.o have been having problems all day.. (the ssh  
git urls for folks who have push access work fine).. although it has  
worked for me a couple times today, given enough time.

>

> (not sure if we have github/etc mirrors somewhere? I do have a github  
clone of mesa which is up to date as of ~10min ago.. I could do the  
same for other git trees if someone somewhere is stuck)

  
Sorry about this, it is quite bad. I think having mirrors for the key DRM
trees on GitHub is a good idea though, and I can get to setting that up.
Stephen, you need DRM (airlied), drm-misc, drm-panel, drm-intel, drm-tegra,
drm-exynos and drm-msm, right?

  

Though, whilst you're at it, I noticed that the drm-misc tree needs updating:
it's now at git://anongit.freedesktop.org/drm/drm-misc, rather than a branch
of drm-intel.

  

Cheers,

Daniel


--d5a5553299474dd1b72d81579e508acd
Content-Transfer-Encoding: base64
Content-Type: text/html; charset="ascii"
Mime-Version: 1.0

SGkgZ3V5cyw8YnI+PGJyPjxzaWduYXR1cmU+PC9zaWduYXR1cmU+CiAgICAgICAgPGRpdiBjbGFz
cz0iZ21haWxfcXVvdGUgbnlsYXMtcXVvdGUgbnlsYXMtcXVvdGUtaWQtYTNyZnE0cm1kbnk5NmZj
Y3h3NmtrMHkwIj4KICAgICAgICAgIDxicj4KICAgICAgICAgIE9uIE5vdiAzMCAyMDE2LCBhdCAx
MDo0OSBwbSwgUm9iIENsYXJrICZsdDtyb2JkY2xhcmtAZ21haWwuY29tJmd0OyB3cm90ZToKICAg
ICAgICAgIDxicj4KICAgICAgICAgIDxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5
bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2NjIHNvbGlkO3BhZGRpbmct
bGVmdDoxZXg7Ij4KICAgICAgICAgICAgPHA+eWVhaCwge2NnaXQsYW5vbmdpdH0uZmQubyBoYXZl
IGJlZW4gaGF2aW5nIHByb2JsZW1zIGFsbCBkYXkuLiAodGhlIHNzaDxicj5naXQgdXJscyBmb3Ig
Zm9sa3Mgd2hvIGhhdmUgcHVzaCBhY2Nlc3Mgd29yayBmaW5lKS4uIGFsdGhvdWdoIGl0IGhhczxi
cj53b3JrZWQgZm9yIG1lIGEgY291cGxlIHRpbWVzIHRvZGF5LCBnaXZlbiBlbm91Z2ggdGltZS48
L3A+CjxwPihub3Qgc3VyZSBpZiB3ZSBoYXZlIGdpdGh1Yi9ldGMgbWlycm9ycyBzb21ld2hlcmU/
ICBJIGRvIGhhdmUgYSBnaXRodWI8YnI+Y2xvbmUgb2YgbWVzYSB3aGljaCBpcyB1cCB0byBkYXRl
IGFzIG9mIH4xMG1pbiBhZ28uLiBJIGNvdWxkIGRvIHRoZTxicj5zYW1lIGZvciBvdGhlciBnaXQg
dHJlZXMgaWYgc29tZW9uZSBzb21ld2hlcmUgaXMgc3R1Y2spPC9wPgo8L2Jsb2NrcXVvdGU+PGJy
PlNvcnJ5IGFib3V0IHRoaXMsIGl0IGlzIHF1aXRlIGJhZC4gSSB0aGluayBoYXZpbmcgbWlycm9y
cyBmb3IgdGhlIGtleSBEUk0gdHJlZXMgb24gR2l0SHViIGlzIGEgZ29vZCBpZGVhIHRob3VnaCwg
YW5kIEkgY2FuIGdldCB0byBzZXR0aW5nIHRoYXQgdXAuIFN0ZXBoZW4sIHlvdSBuZWVkIERSTSAo
YWlybGllZCksIGRybS1taXNjLCBkcm0tcGFuZWwsIGRybS1pbnRlbCwgZHJtLXRlZ3JhLCBkcm0t
ZXh5bm9zIGFuZCBkcm0tbXNtLCByaWdodD88L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBu
eWxhcy1xdW90ZSBueWxhcy1xdW90ZS1pZC1hM3JmcTRybWRueTk2ZmNjeHc2a2sweTAiPjxicj48
L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSBueWxhcy1xdW90ZSBueWxhcy1xdW90ZS1pZC1h
M3JmcTRybWRueTk2ZmNjeHc2a2sweTAiPlRob3VnaCwgd2hpbHN0IHlvdSdyZSBhdCBpdCwgSSBu
b3RpY2VkIHRoYXQgdGhlIGRybS1taXNjIHRyZWUgbmVlZHMgdXBkYXRpbmc6IGl0J3Mgbm93IGF0
IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYywgcmF0aGVyIHRoYW4g
YSBicmFuY2ggb2YgZHJtLWludGVsLjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIG55bGFz
LXF1b3RlIG55bGFzLXF1b3RlLWlkLWEzcmZxNHJtZG55OTZmY2N4dzZrazB5MCI+PGRpdj48YnI+
PC9kaXY+PGRpdj5DaGVlcnMsPC9kaXY+PGRpdj5EYW5pZWw8L2Rpdj48cD48L3A+CiAgICAgICAg
ICAKICAgICAgICA8L2Rpdj48ZGl2IGlkPSJuMS1xdW90ZWQtdGV4dC1tYXJrZXIiPjwvZGl2Pg==
--d5a5553299474dd1b72d81579e508acd--

--===============0150855615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0150855615==--
