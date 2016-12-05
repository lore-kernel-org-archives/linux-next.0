From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: next-20161205 build: 3 failures 4 warnings (next-20161205)
Date: Mon, 5 Dec 2016 10:52:53 +0000
Message-ID: <b8c4cce8-c114-b576-c073-7d14fd79f0f0@arm.com>
References: <E1cDo86-0008IX-9W@optimist>
 <20161205104455.2m5ky3hgd5n2kb2w@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20161205104455.2m5ky3hgd5n2kb2w@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org
List-Id: linux-next.vger.kernel.org

On 05/12/16 10:44, Mark Brown wrote:
> On Mon, Dec 05, 2016 at 07:56:06AM +0000, Build bot for Mark Brown wrote:
> 
> Today's -next fails to build an arm64 allmodconfig:  
> 
>> 	arm64-allmodconfig
>> ../arch/arm64/include/asm/probes.h:18:25: fatal error: asm/opcodes.h: No such file or directory
> 
> due to bca8f17f57bd76d (arm64: Get rid of asm/opcodes.h) having missed
> one reference to the header.

Fix on the list: https://www.spinics.net/lists/arm-kernel/msg546960.html

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
