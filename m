From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 8 Dec 2015 11:20:14 +1100
Message-ID: <20151208112014.3cb0e3a1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

SGkgYWxsLAoKQWZ0ZXIgbWVyZ2luZyB0aGUgZHJtLW1pc2MgdHJlZSwgdG9kYXkncyBsaW51eC1u
ZXh0IGJ1aWxkICh4ODZfNjQKYWxsbW9kY29uZmlnKSBmYWlsZWQgbGlrZSB0aGlzOgoKZHJpdmVy
cy9ncHUvZHJtL2kyYy90ZGE5OTh4X2Rydi5jOjEzNTQ6MjogZXJyb3I6IHVua25vd24gZmllbGQg
J3NhdmUnIHNwZWNpZmllZCBpbiBpbml0aWFsaXplcgogIC5zYXZlID0gdGRhOTk4eF9lbmNvZGVy
X3NhdmUsCiAgXgpkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmM6MTM1NDoxMDogd2Fy
bmluZzogaW5pdGlhbGl6YXRpb24gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRlciB0eXBlIFstV2lu
Y29tcGF0aWJsZS1wb2ludGVyLXR5cGVzXQogIC5zYXZlID0gdGRhOTk4eF9lbmNvZGVyX3NhdmUs
CiAgICAgICAgICBeCmRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYzoxMzU0OjEwOiBu
b3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3IgJ3RkYTk5OHhfZW5jb2Rlcl9oZWxwZXJfZnVu
Y3MubW9kZV9maXh1cCcpCmRyaXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk4eF9kcnYuYzoxMzU1OjI6
IGVycm9yOiB1bmtub3duIGZpZWxkICdyZXN0b3JlJyBzcGVjaWZpZWQgaW4gaW5pdGlhbGl6ZXIK
ICAucmVzdG9yZSA9IHRkYTk5OHhfZW5jb2Rlcl9yZXN0b3JlLAogIF4KCkNhdXNlZCBieSBjb21t
aXQKCiAgNzlmMTNhZDVkOGUwICgiZHJtOiBNb3ZlIGVuY29kZXItPnNhdmUvcmVzdG9yZSBpbnRv
IG5vdXZlYXUiKQoKSSBoYXZlIHVzZWQgdGhlIGRybS1taXNjIHRyZWUgZnJvbSBuZXh0LTIwMTUx
MjA3IGZvciB0b2RheS4KCi0tIApDaGVlcnMsClN0ZXBoZW4gUm90aHdlbGwgICAgICAgICAgICAg
ICAgICAgIHNmckBjYW5iLmF1dWcub3JnLmF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
