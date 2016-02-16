From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2] arm64/efi: Make strnlen() available to the EFI namespace
Date: Tue, 16 Feb 2016 11:16:31 +0100
Message-ID: <1455617791-4791-1-git-send-email-thierry.reding@gmail.com>
References: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1455563856-1553-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
List-Id: linux-next.vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Changes introduced in the upstream version of libfdt pulled in by commit
91feabc2e224 ("scripts/dtc: Update to upstream commit b06e55c88b9b") use
the strnlen() function, which isn't currently available to the EFI name-
space. Add it to the EFI namespace to avoid a linker error.

Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- mark strnlen() position independent and refer to __pi_strnlen

 arch/arm64/kernel/image.h | 1 +
 arch/arm64/lib/strnlen.S  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/image.h b/arch/arm64/kernel/image.h
index 999633bd7294..352f7abd91c9 100644
--- a/arch/arm64/kernel/image.h
+++ b/arch/arm64/kernel/image.h
@@ -89,6 +89,7 @@ __efistub_memcpy		= KALLSYMS_HIDE(__pi_memcpy);
 __efistub_memmove		= KALLSYMS_HIDE(__pi_memmove);
 __efistub_memset		= KALLSYMS_HIDE(__pi_memset);
 __efistub_strlen		= KALLSYMS_HIDE(__pi_strlen);
+__efistub_strnlen		= KALLSYMS_HIDE(__pi_strnlen);
 __efistub_strcmp		= KALLSYMS_HIDE(__pi_strcmp);
 __efistub_strncmp		= KALLSYMS_HIDE(__pi_strncmp);
 __efistub___flush_dcache_area	= KALLSYMS_HIDE(__pi___flush_dcache_area);
diff --git a/arch/arm64/lib/strnlen.S b/arch/arm64/lib/strnlen.S
index 2ca665711bf2..eae38da6e0bb 100644
--- a/arch/arm64/lib/strnlen.S
+++ b/arch/arm64/lib/strnlen.S
@@ -168,4 +168,4 @@ CPU_LE( lsr	tmp2, tmp2, tmp4 )	/* Shift (tmp1 & 63).  */
 .Lhit_limit:
 	mov	len, limit
 	ret
-ENDPROC(strnlen)
+ENDPIPROC(strnlen)
-- 
2.7.1
