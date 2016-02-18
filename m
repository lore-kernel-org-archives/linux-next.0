From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Subject: [PATCH next] ARM: virt: fix build of hyp-stub
Date: Fri, 19 Feb 2016 00:31:17 +0100
Message-ID: <1455838277-11083-1-git-send-email-vincent.stehle@laposte.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-next@vger.kernel.org
Cc: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, linux-kernel@vger.kernel.org, =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>, Marc Zyngier <marc.zyngier@arm.com>, Russell King <rmk+kernel@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

Q29tcGlsZSBoeXAtc3R1YiBleHBsaWNpdGx5IGZvciBhcm0gdjctYS4gVGhpcyBmaXhlcyB0aGUg
Zm9sbG93aW5nIGJ1aWxkCmVycm9yczoKCiAgYXJjaC9hcm0va2VybmVsL2h5cC1zdHViLlM6IEFz
c2VtYmxlciBtZXNzYWdlczoKICBhcmNoL2FybS9rZXJuZWwvaHlwLXN0dWIuUzoxNjg6IEVycm9y
OiBzZWxlY3RlZCBwcm9jZXNzb3IgZG9lcyBub3Qgc3VwcG9ydCBgdWJmeCByNyxyNywjMjgsIzQn
IGluIEFSTSBtb2RlCiAgYXJjaC9hcm0va2VybmVsL2h5cC1zdHViLlM6MTc2OiBFcnJvcjogc2Vs
ZWN0ZWQgcHJvY2Vzc29yIGRvZXMgbm90IHN1cHBvcnQgYGlzYicgaW4gQVJNIG1vZGUKClNpZ25l
ZC1vZmYtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0ZS5uZXQ+CkNj
OiBKZWFuLVBoaWxpcHBlIEJydWNrZXIgPGplYW4tcGhpbGlwcGUuYnJ1Y2tlckBhcm0uY29tPgpD
YzogTWFyYyBaeW5naWVyIDxtYXJjLnp5bmdpZXJAYXJtLmNvbT4KQ2M6IFJ1c3NlbGwgS2luZyA8
cm1rK2tlcm5lbEBhcm0ubGludXgub3JnLnVrPgotLS0KCgpIaSwKClRoaXMgY2FuIGJlIHNlZW4g
d2l0aCBsaW51eCBuZXh0LTIwMTYwMjE4IGFuZCBhcm0gZS5nLiBhbGxtb2Rjb25maWcuCgpCZXN0
IHJlZ2FyZHMsCgpWLgoKCiBhcmNoL2FybS9rZXJuZWwvTWFrZWZpbGUgfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC9hcm0va2VybmVsL01h
a2VmaWxlIGIvYXJjaC9hcm0va2VybmVsL01ha2VmaWxlCmluZGV4IDJjNWYxNjAuLjE1Njg0YzUg
MTAwNjQ0Ci0tLSBhL2FyY2gvYXJtL2tlcm5lbC9NYWtlZmlsZQorKysgYi9hcmNoL2FybS9rZXJu
ZWwvTWFrZWZpbGUKQEAgLTg4LDYgKzg4LDggQEAgb2JqLSQoQ09ORklHX0RFQlVHX0xMKQkrPSBk
ZWJ1Zy5vCiBvYmotJChDT05GSUdfRUFSTFlfUFJJTlRLKQkrPSBlYXJseV9wcmludGsubwogCiBv
YmotJChDT05GSUdfQVJNX1ZJUlRfRVhUKQkrPSBoeXAtc3R1Yi5vCitBRkxBR1NfaHlwLXN0dWIu
bwkJOj0tV2EsLW1hcmNoPWFybXY3LWEKKwogaWZlcSAoJChDT05GSUdfQVJNX1BTQ0kpLHkpCiBv
YmotJChDT05GSUdfU01QKQkJKz0gcHNjaV9zbXAubwogZW5kaWYKLS0gCjIuNy4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5l
bCBtYWlsaW5nIGxpc3QKbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
