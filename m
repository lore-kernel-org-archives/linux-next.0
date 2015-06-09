From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: linux-next: build failure after merge of the drm tree
Date: Tue, 9 Jun 2015 14:02:21 +0000
Message-ID: <A3397C8B8B789E45844E7EC5DEAD89D06E8BF335@satlexdag05.amd.com>
References: <20150609234230.216ac85c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_A3397C8B8B789E45844E7EC5DEAD89D06E8BF335satlexdag05amdc_"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bn1bn0103.outbound.protection.outlook.com ([157.56.110.103]:39424
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S932082AbbFIOSP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Jun 2015 10:18:15 -0400
In-Reply-To: <20150609234230.216ac85c@canb.auug.org.au>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

--_002_A3397C8B8B789E45844E7EC5DEAD89D06E8BF335satlexdag05amdc_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> Sent: Tuesday, June 09, 2015 9:43 AM
> To: Dave Airlie
> Cc: linux-next@vger.kernel.org; linux-kernel@vger.kernel.org; Deucher,
> Alexander
> Subject: linux-next: build failure after merge of the drm tree
>=20
> Hi Dave,
>=20
> After merging the drm tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
>=20
> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function
> 'gfx_v7_0_cp_gfx_resume':
> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: error: 'BUF_SWAP_32BIT'
> undeclared (first use in this function)
>   tmp |=3D BUF_SWAP_32BIT;
>          ^
> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:2879:9: note: each undeclared
> identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c: In function
> 'gfx_v7_0_cp_compute_resume':
> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:3398:41: error:
> 'BUF_SWAP_32BIT' undeclared (first use in this function)
>    mqd->queue_state.cp_hqd_pq_control |=3D BUF_SWAP_32BIT;
>                                          ^
> drivers/gpu/drm/amd/amdgpu/cik_sdma.c: In function
> 'cik_sdma_gfx_resume':
> drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: error:
> 'SDMA_RB_SWAP_ENABLE' undeclared (first use in this function)
>    rb_cntl |=3D SDMA_RB_SWAP_ENABLE |
> SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
>               ^
> drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:14: note: each undeclared
> identifier is reported only once for each function it appears in
> drivers/gpu/drm/amd/amdgpu/cik_sdma.c:413:36: error:
> 'SDMA_RPTR_WRITEBACK_SWAP_ENABLE' undeclared (first use in this
> function)
>    rb_cntl |=3D SDMA_RB_SWAP_ENABLE |
> SDMA_RPTR_WRITEBACK_SWAP_ENABLE;
>                                     ^
>=20
> Caused by commit a2e73f56fa62 ("drm/amdgpu: Add support for CIK parts").
>=20

Should be fixed with this patch.  Sorry for the breakage.

Alex


> I added the following patch to disable this code for today:
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 9 Jun 2015 23:38:30 +1000
> Subject: [PATCH] drm/amdgpu: disable CIK parts for now
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig
> b/drivers/gpu/drm/amd/amdgpu/Kconfig
> index b30fcfa4b1f2..8da6bf7f39c8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> @@ -1,6 +1,7 @@
>  config DRM_AMDGPU_CIK
>  	bool "Enable amdgpu support for CIK parts"
>  	depends on DRM_AMDGPU
> +	depends on BROKEN
>  	help
>  	  Choose this option if you want to enable experimental support
>  	  for CIK asics.
> --
> 2.1.4
>=20
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au

--_002_A3397C8B8B789E45844E7EC5DEAD89D06E8BF335satlexdag05amdc_
Content-Type: application/octet-stream;
	name="0001-drm-amdgpu-fix-the-build-on-big-endian.patch"
Content-Description: 0001-drm-amdgpu-fix-the-build-on-big-endian.patch
Content-Disposition: attachment;
	filename="0001-drm-amdgpu-fix-the-build-on-big-endian.patch"; size=2165;
	creation-date="Tue, 09 Jun 2015 14:00:38 GMT";
	modification-date="Tue, 09 Jun 2015 13:59:38 GMT"
Content-Transfer-Encoding: base64

RnJvbSAzNWQwMjlhMjBmZTEzMTIzMDlmZDAxY2I3OGU1NjU2NTdmYTIxZTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IFR1ZSwgOSBKdW4gMjAxNSAwOTo1ODoyMyAtMDQwMApTdWJqZWN0OiBbUEFUQ0hd
IGRybS9hbWRncHU6IGZpeCB0aGUgYnVpbGQgb24gYmlnIGVuZGlhbgoKU29tZSBsZWZ0b3ZlciBj
b3B5IGFuZCBwYXN0ZXMgZnJvbSByYWRlb24gdGhhdCBuZXZlcgpnb3QgdXBkYXRlZC4KClJlcG9y
dGVkLWJ5OiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Npa19zZG1hLmMgfCAzICsrLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYyB8IDUgKysrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2Npa19zZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9jaWtfc2Rt
YS5jCmluZGV4IGZiOTMxNjMuLmFiODNjYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2Npa19zZG1hLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvY2lr
X3NkbWEuYwpAQCAtNDExLDcgKzQxMSw4IEBAIHN0YXRpYyBpbnQgY2lrX3NkbWFfZ2Z4X3Jlc3Vt
ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAkJcmJfYnVmc3ogPSBvcmRlcl9iYXNlXzIo
cmluZy0+cmluZ19zaXplIC8gNCk7CiAJCXJiX2NudGwgPSByYl9idWZzeiA8PCAxOwogI2lmZGVm
IF9fQklHX0VORElBTgotCQlyYl9jbnRsIHw9IFNETUFfUkJfU1dBUF9FTkFCTEUgfCBTRE1BX1JQ
VFJfV1JJVEVCQUNLX1NXQVBfRU5BQkxFOworCQlyYl9jbnRsIHw9IFNETUEwX0dGWF9SQl9DTlRM
X19SQl9TV0FQX0VOQUJMRV9NQVNLIHwKKwkJCVNETUEwX0dGWF9SQl9DTlRMX19SUFRSX1dSSVRF
QkFDS19TV0FQX0VOQUJMRV9NQVNLOwogI2VuZGlmCiAJCVdSRUczMihtbVNETUEwX0dGWF9SQl9D
TlRMICsgc2RtYV9vZmZzZXRzW2ldLCByYl9jbnRsKTsKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvZ2Z4X3Y3XzAuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92N18wLmMKaW5kZXggYWZhNzAzYy4uY2I3OTA3NDQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92N18wLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZ2Z4X3Y3XzAuYwpAQCAtMjg4MSw3ICsyODgxLDcgQEAgc3RhdGljIGludCBnZnhfdjdf
MF9jcF9nZnhfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCXJiX2J1ZnN6ID0g
b3JkZXJfYmFzZV8yKHJpbmctPnJpbmdfc2l6ZSAvIDgpOwogCXRtcCA9IChvcmRlcl9iYXNlXzIo
QU1ER1BVX0dQVV9QQUdFX1NJWkUvOCkgPDwgOCkgfCByYl9idWZzejsKICNpZmRlZiBfX0JJR19F
TkRJQU4KLQl0bXAgfD0gQlVGX1NXQVBfMzJCSVQ7CisJdG1wIHw9IDIgPDwgQ1BfUkIwX0NOVExf
X0JVRl9TV0FQX19TSElGVDsKICNlbmRpZgogCVdSRUczMihtbUNQX1JCMF9DTlRMLCB0bXApOwog
CkBAIC0zNDAwLDcgKzM0MDAsOCBAQCBzdGF0aWMgaW50IGdmeF92N18wX2NwX2NvbXB1dGVfcmVz
dW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCQltcWQtPnF1ZXVlX3N0YXRlLmNwX2hx
ZF9wcV9jb250cm9sIHw9CiAJCQkob3JkZXJfYmFzZV8yKEFNREdQVV9HUFVfUEFHRV9TSVpFLzgp
IDw8IDgpOwogI2lmZGVmIF9fQklHX0VORElBTgotCQltcWQtPnF1ZXVlX3N0YXRlLmNwX2hxZF9w
cV9jb250cm9sIHw9IEJVRl9TV0FQXzMyQklUOworCQltcWQtPnF1ZXVlX3N0YXRlLmNwX2hxZF9w
cV9jb250cm9sIHw9CisJCQkyIDw8IENQX0hRRF9QUV9DT05UUk9MX19FTkRJQU5fU1dBUF9fU0hJ
RlQ7CiAjZW5kaWYKIAkJbXFkLT5xdWV1ZV9zdGF0ZS5jcF9ocWRfcHFfY29udHJvbCAmPQogCQkJ
fihDUF9IUURfUFFfQ09OVFJPTF9fVU5PUkRfRElTUEFUQ0hfTUFTSyB8Ci0tIAoxLjguMy4xCgo=

--_002_A3397C8B8B789E45844E7EC5DEAD89D06E8BF335satlexdag05amdc_--
