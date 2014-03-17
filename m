From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
Subject: Re: linux-next: manual merge of the tip tree with the arm-soc tree
Date: Mon, 17 Mar 2014 09:41:18 -0700
Message-ID: <6b7bc052-bb06-4821-9710-50c4852425c8@AM1EHSMHS002.ehs.local>
References: <20140317163506.5770f06a77ba011e682f47ff@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20140317163506.5770f06a77ba011e682f47ff@canb.auug.org.au>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rob Herring <robh@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, "H.
 Peter Anvin" <hpa@zytor.com>, Olof Johansson <olof@lixom.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

T24gTW9uLCAyMDE0LTAzLTE3IGF0IDA0OjM1UE0gKzExMDAsIFN0ZXBoZW4gUm90aHdlbGwgd3Jv
dGU6Cj4gSGkgYWxsLAo+IAo+IFRvZGF5J3MgbGludXgtbmV4dCBtZXJnZSBvZiB0aGUgdGlwIHRy
ZWUgZ290IGEgY29uZmxpY3QgaW4KPiBhcmNoL2FybS9tYWNoLXp5bnEvS2NvbmZpZyBiZXR3ZWVu
IGNvbW1pdCBkZGI5MDJjYzM0NTkgKCJBUk06IGNlbnRyYWxpemUKPiBjb21tb24gbXVsdGktcGxh
dGZvcm0ga2NvbmZpZyBvcHRpb25zIikgZnJvbSB0aGUgYXJtLXNvYyB0cmVlIGFuZCBjb21taXQK
PiBjZDMyNTI5NTg3MWYgKCJhcm06IHp5bnE6IEFkZCBzdXBwb3J0IGZvciBjcHVmcmVxIikgZnJv
bSB0aGUgdGlwIHRyZWUuCj4gCj4gSSBmaXhlZCBpdCB1cCAoc2VlIGJlbG93KSBhbmQgY2FuIGNh
cnJ5IHRoZSBmaXggYXMgbmVjZXNzYXJ5IChubyBhY3Rpb24KPiBpcyByZXF1aXJlZCkuCj4gCj4g
LS0gCj4gQ2hlZXJzLAo+IFN0ZXBoZW4gUm90aHdlbGwgICAgICAgICAgICAgICAgICAgIHNmckBj
YW5iLmF1dWcub3JnLmF1Cj4gCj4gZGlmZiAtLWNjIGFyY2gvYXJtL21hY2gtenlucS9LY29uZmln
Cj4gaW5kZXggMTA1ZDM5YjcyYTI1LGYwM2U3NWJkMGIyYi4uMDAwMDAwMDAwMDAwCj4gLS0tIGEv
YXJjaC9hcm0vbWFjaC16eW5xL0tjb25maWcKPiArKysgYi9hcmNoL2FybS9tYWNoLXp5bnEvS2Nv
bmZpZwo+IEBAQCAtMiwxMCAtMiwxOSArMiwxMiBAQEAgY29uZmlnIEFSQ0hfWllOCj4gICAJYm9v
bCAiWGlsaW54IFp5bnEgQVJNIENvcnRleCBBOSBQbGF0Zm9ybSIgaWYgQVJDSF9NVUxUSV9WNwo+
ICAgCXNlbGVjdCBBUk1fQU1CQQo+ICAgCXNlbGVjdCBBUk1fR0lDCj4gKyAJc2VsZWN0IEFSQ0hf
SEFTX0NQVUZSRVEKPiArIAlzZWxlY3QgQVJDSF9IQVNfT1BQCj4gIC0Jc2VsZWN0IENPTU1PTl9D
TEsKPiAgLQlzZWxlY3QgQ1BVX1Y3Cj4gIC0Jc2VsZWN0IEdFTkVSSUNfQ0xPQ0tFVkVOVFMKPiAg
IAlzZWxlY3QgSEFWRV9BUk1fU0NVIGlmIFNNUAo+ICAgCXNlbGVjdCBIQVZFX0FSTV9UV0QgaWYg
U01QCj4gICAJc2VsZWN0IElDU1QKPiAgLQlzZWxlY3QgTUlHSFRfSEFWRV9DQUNIRV9MMlgwCgpU
aGUgdHdvIGNvbmZsaWN0aW5nIHBhdGNoZXMgbWVudGlvbmVkIGFib3ZlIGRvbid0IHRvdWNoIHRo
aXMgbGluZSwgSQp0aGluay4gSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBzaG91bGQgZ28gYXdh
eS4KQXBhcnQgZnJvbSB0aGlzLCB0aGluZ3MgbG9vayBva2F5IHRvIG1lLgoKCVRoYW5rcywKCVPD
tnJlbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdApsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hcm0ta2VybmVsCg==
