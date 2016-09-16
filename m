From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with Linus' tree
Date: Fri, 16 Sep 2016 10:38:38 +1000
Message-ID: <20160916103838.34a84b44@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Deepak M <m.deepak@intel.com>, Jani Nikula <jani.nikula@intel.com>, Lyude <cpaul@redhat.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

SGkgYWxsLAoKVG9kYXkncyBsaW51eC1uZXh0IG1lcmdlIG9mIHRoZSBkcm0taW50ZWwgdHJlZSBn
b3QgYSBjb25mbGljdCBpbjoKCiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfcG0uYwoKYmV0
d2VlbiBjb21taXQ6CgogIGY0MDMzNzI2NThmYyAoImRybS9pOTE1L3NrbDogQWRkIHN1cHBvcnQg
Zm9yIHRoZSBTQUdWLCBmaXggdW5kZXJydW4gaGFuZ3MiKQood2hpY2ggaXMgYWxzbyBpbiB0aGUg
ZHJtLWludGVsIHRyZWUpCgpmcm9tIExpbnVzJyB0cmVlIGFuZCBjb21taXQ6CgogIDZmM2ZmZjYw
MmU4MSAoImRybS9pOTE1OiBBZGQgZGRiIHNpemUgZmllbGQgdG8gZGV2aWNlIGluZm8gc3RydWN0
dXJlIikKCmZyb20gdGhlIGRybS1pbnRlbCB0cmVlLgoKSSBmaXhlZCBpdCB1cCAoSSBqdXN0IHVz
ZWQgdGhlIGRybS1pbnRlbCB2ZXJzaW9uKSBhbmQgY2FuIGNhcnJ5IHRoZSBmaXgKYXMgbmVjZXNz
YXJ5LiBUaGlzIGlzIG5vdyBmaXhlZCBhcyBmYXIgYXMgbGludXgtbmV4dCBpcyBjb25jZXJuZWQs
IGJ1dAphbnkgbm9uIHRyaXZpYWwgY29uZmxpY3RzIHNob3VsZCBiZSBtZW50aW9uZWQgdG8geW91
ciB1cHN0cmVhbSBtYWludGFpbmVyCndoZW4geW91ciB0cmVlIGlzIHN1Ym1pdHRlZCBmb3IgbWVy
Z2luZy4gIFlvdSBtYXkgYWxzbyB3YW50IHRvIGNvbnNpZGVyCmNvb3BlcmF0aW5nIHdpdGggdGhl
IG1haW50YWluZXIgb2YgdGhlIGNvbmZsaWN0aW5nIHRyZWUgdG8gbWluaW1pc2UgYW55CnBhcnRp
Y3VsYXJseSBjb21wbGV4IGNvbmZsaWN0cy4KCi0tIApDaGVlcnMsClN0ZXBoZW4gUm90aHdlbGwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
