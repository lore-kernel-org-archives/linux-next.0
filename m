From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20160222 build: 5 failures 9 warnings (next-20160222)
Date: Wed, 24 Feb 2016 14:48:59 +1100
Message-ID: <20160224144859.027a3564@canb.auug.org.au>
References: <E1aXlz4-000486-Pb@optimist> <20160222100832.GX18327@sirena.org.uk>
 <56CAE5E6.7030707@arm.com> <20160224032842.GK18327@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kvmarm-bounces@lists.cs.columbia.edu>
In-Reply-To: <20160224032842.GK18327@sirena.org.uk>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu
List-Id: linux-next.vger.kernel.org

Hi Mark,

On Wed, 24 Feb 2016 12:28:42 +0900 Mark Brown <broonie@kernel.org> wrote:
>
> That didn't work out unfortunately, the error is still there today.

Yeah, the patch didn't hit -next yesterday and I missed the opportunity
to fix in manually.  However, it should be fixed in today's linux-next
(out in a few hours, hopefully).

-- 
Cheers,
Stephen Rothwell
