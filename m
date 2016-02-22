From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: next-20160222 build: 5 failures 9 warnings (next-20160222)
Date: Tue, 23 Feb 2016 00:19:04 +1100
Message-ID: <20160223001904.3ed3e402@canb.auug.org.au>
References: <E1aXlz4-000486-Pb@optimist> <20160222100832.GX18327@sirena.org.uk>
 <56CAE5E6.7030707@arm.com>
 <20160222115243.GA5779@e106950-lin.cambridge.arm.com>
 <56CAF868.5020406@arm.com>
 <20160222120730.GB5779@e106950-lin.cambridge.arm.com>
 <56CB029F.2060409@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <kvmarm-bounces@lists.cs.columbia.edu>
In-Reply-To: <56CB029F.2060409@arm.com>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, kvmarm@lists.cs.columbia.edu, Mark Brown <broonie@kernel.org>, linux-next@vger.kernel.org, Brian Starkey <brian.starkey@arm.com>
List-Id: linux-next.vger.kernel.org

Hi Marc,

On Mon, 22 Feb 2016 12:44:15 +0000 Marc Zyngier <marc.zyngier@arm.com> wrote:
>
> On 22/02/16 12:07, Brian Starkey wrote:
> > On Mon, Feb 22, 2016 at 12:00:40PM +0000, Marc Zyngier wrote:  
> >> On 22/02/16 11:52, Brian Starkey wrote:  
> >>>> This will create a new conflict, but will make the resolution 100% 
> >>>> clear.  
> >>>
> >>> I applied this, but arm64 defconfig wouldn't build until I uncommented
> >>> the '#define kvm_call_hyp(...' line.
> >>>
> >>> Is that right?  
> >>
> >> This patch is intended as a merge indication so that when you do the
> >> merge with the arm64 tree, it conflicts and you can resolve it by going
> >> the right thing (merging the non-comment version of this line).  
> > 
> > Right, now I understand "make the resolution 100% clear" - I guess 100%
> > clear isn't clear enough for me :-(  
> 
> It is not meant to be clear to you, but to whoever is actually performing the merge:

Excellent, thanks for that - hopefully I will get it right tomorrow.

-- 
Cheers,
Stephen Rothwell
