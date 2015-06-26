From: Borislav Petkov <bp@alien8.de>
Subject: Re: linux-next: manual merge of the edac-amd tree with Linus' tree
Date: Fri, 26 Jun 2015 09:27:23 +0200
Message-ID: <20150626072723.GB14572@pd.tnic>
References: <20150626170839.7a0945c5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150626170839.7a0945c5@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi Stephen,

On Fri, Jun 26, 2015 at 05:08:39PM +1000, Stephen Rothwell wrote:
> Hi Borislav,
> 
> Today's linux-next merge of the edac-amd tree got a conflict in:
> 
>   drivers/edac/mce_amd_inj.c
> 
> between commits from Linus' tree and the same commits plus more from
> the edac-amd tree.
> 
> I just dropped the edac-amd tree for today as it seems that it was just
> rebased and a few commits dropped before Linus was asked to merge it.

yes, that's the right thing to do. If there's anything I should do to
let you know when to start merging it again, please let me know.

Thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
