From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: build failure after merge of the tip
 tree (from the drm-intel tree)
Date: Tue, 5 Jul 2016 10:25:12 +0200
Message-ID: <20160705082512.GX30921@twins.programming.kicks-ass.net>
References: <20160705135303.6a1bc80a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20160705135303.6a1bc80a@canb.auug.org.au>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Paul McKenney <paulmck@linux.vnet.ibm.com>, Ingo Molnar <mingo@elte.hu>
List-Id: linux-next.vger.kernel.org

T24gVHVlLCBKdWwgMDUsIDIwMTYgYXQgMDE6NTM6MDNQTSArMTAwMCwgU3RlcGhlbiBSb3Rod2Vs
bCB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtLmMKPiBpbmRleCBkMzUwMmMwNjAzZTUuLjFm
OTFmMTg3YjJhOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW0uYwo+IEBAIC0zMjkwLDcgKzMy
OTAsNyBAQCBpOTE1X2dlbV9yZXRpcmVfd29ya19oYW5kbGVyKHN0cnVjdCB3b3JrX3N0cnVjdCAq
d29yaykKPiAgCSAqIFdlIGRvIG5vdCBuZWVkIHRvIGRvIHRoaXMgdGVzdCB1bmRlciBsb2NraW5n
IGFzIGluIHRoZSB3b3JzdC1jYXNlCj4gIAkgKiB3ZSBxdWV1ZSB0aGUgcmV0aXJlIHdvcmtlciBv
bmNlIHRvbyBvZnRlbi4KPiAgCSAqLwo+IC0JaWYgKGxvY2tsZXNzX2RlcmVmZXJlbmNlKGRldl9w
cml2LT5ndC5hd2FrZSkpCj4gKwlpZiAoLypsb2NrbGVzc19kZXJlZmVyZW5jZSovKGRldl9wcml2
LT5ndC5hd2FrZSkpCj4gIAkJcXVldWVfZGVsYXllZF93b3JrKGRldl9wcml2LT53cSwKPiAgCQkJ
CSAgICZkZXZfcHJpdi0+Z3QucmV0aXJlX3dvcmssCj4gIAkJCQkgICByb3VuZF9qaWZmaWVzX3Vw
X3JlbGF0aXZlKEhaKSk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
aXJxLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2lycS5jCj4gaW5kZXggZjZkZThkZDU2
N2EyLi4yYzE5MjY0MTg2OTEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkx
NV9pcnEuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfaXJxLmMKPiBAQCAtMzA5
NSw3ICszMDk1LDcgQEAgc3RhdGljIHZvaWQgaTkxNV9oYW5nY2hlY2tfZWxhcHNlZChzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCj4gIAlpZiAoIWk5MTUuZW5hYmxlX2hhbmdjaGVjaykKPiAgCQly
ZXR1cm47Cj4gIAo+IC0JaWYgKCFsb2NrbGVzc19kZXJlZmVyZW5jZShkZXZfcHJpdi0+Z3QuYXdh
a2UpKQo+ICsJaWYgKCEvKmxvY2tsZXNzX2RlcmVmZXJlbmNlKi8oZGV2X3ByaXYtPmd0LmF3YWtl
KSkKPiAgCQlyZXR1cm47Cj4gIAo+ICAJLyogQXMgZW5hYmxpbmcgdGhlIEdQVSByZXF1aXJlcyBm
YWlybHkgZXh0ZW5zaXZlIG1taW8gYWNjZXNzLAoKUmlnaHQsIG5laXRoZXIgY2FzZSBhcHBlYXJz
IHRvIGluY2x1ZGUgYSBkYXRhIGRlcGVuZGVuY3kgYW5kIHRodXMKbG9ja2xlc3NfZGVyZWZlcmVu
Y2UoKSBzZWVtcyBtaXNndWlkZWQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpJbnRlbC1nZnggbWFpbGluZyBsaXN0CkludGVsLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pbnRlbC1nZngK
