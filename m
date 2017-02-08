From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: next-20170208 build: 1 failures 16 warnings (next-20170208)
Date: Wed, 8 Feb 2017 09:25:40 -0800
Message-ID: <CAB=NE6X1WMByuARS4mZ1g9+W=LuVBnMDnh_5zyN0CLADaVh=Jw@mail.gmail.com>
References: <E1cbPtA-00012m-9J@optimist>
 <20170208172250.rnqxq7g77ekuo2pv@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170208172250.rnqxq7g77ekuo2pv@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-next@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Wed, Feb 8, 2017 at 9:22 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Feb 08, 2017 at 10:54:16AM +0000, Build bot for Mark Brown wrote:
>
> Today's -next fails to build an arm64 allmodconfig due to:
>
>>       arm64-allmodconfig
>> ../arch/arm64/kernel/armv8_deprecated.c:359:31: error: expected '=',
>> ',', ';',
> +'asm' or '__attribute__' before 'aarch32_check_condition'
>> ../arch/arm64/kernel/armv8_deprecated.c:386:10: error: implicit
>> declaration of
> +function 'aarch32_check_condition'
> [-Werror=implicit-function-declaration]
>
> triggered by 1930faf201e83f6 (kprobes: move kprobe declarations to
> asm-generic/kprobes.h) according to a bisect, though I didn't
> immediately see how.

This fixes that, will send patch.

--- a/arch/arm64/kernel/armv8_deprecated.c
+++ b/arch/arm64/kernel/armv8_deprecated.c
@@ -19,6 +19,7 @@
 #include <asm/sysreg.h>
 #include <asm/system_misc.h>
 #include <asm/traps.h>
+#include <asm/kprobes.h>
 #include <linux/uaccess.h>
 #include <asm/cpufeature.h>
