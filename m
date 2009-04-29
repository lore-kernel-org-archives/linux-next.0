From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: linux-next: upstream tree build warning with st.c
Date: Wed, 29 Apr 2009 15:58:10 +0000
Message-ID: <1241020690.3369.34.camel@mulgrave.int.hansenpartnership.com>
References: <20090428130354.cbb6ed7d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-scsi-owner@vger.kernel.org>
In-Reply-To: <20090428130354.cbb6ed7d.sfr@canb.auug.org.au>
Sender: linux-scsi-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>, Kai Makisara <Kai.Makisara@kolumbus.fi>
List-Id: linux-next.vger.kernel.org

On Tue, 2009-04-28 at 13:03 +1000, Stephen Rothwell wrote:
> Hi James,
> 
> Today's linux-next build (powerpc ppc64_defconfig gcc4.4.0) produced this
> warning (it has for a while):
> 
> drivers/scsi/st.c: In function 'st_int_ioctl':
> drivers/scsi/st.c:2967: warning: suggest parentheses around operand of '!' or change '|' to '||' or '!' to '~'
> 
> The code in question:
> 
> 	STp->use_pf = !STp->use_pf | PF_TESTED;
> 
> looks questionable at best.

Yes, I think it should become

STp |= PF_TESTED;

but I'm not sure, so I'll defer to Kai.

James


