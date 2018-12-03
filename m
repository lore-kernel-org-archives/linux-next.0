From: Luciano Coelho <luciano.coelho@intel.com>
Subject: Re: linux-next: build warnings after merge of the
 wireless-drivers-next tree
Date: Mon, 03 Dec 2018 14:38:26 +0200
Message-ID: <1773a3329bcd1bde2a22c267e4c582b0149a307e.camel@intel.com>
References: <20181130120555.1d35eb6b@canb.auug.org.au>
         <87lg5b5glw.fsf@kamboji.qca.qualcomm.com>
         <20181130165006.60b2545f@canb.auug.org.au>
         <87h8fz57ty.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87h8fz57ty.fsf@kamboji.qca.qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wireless <linux-wireless@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sara Sharon <sara.sharon@intel.com>, Kees Cook <keescook@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: linux-next.vger.kernel.org

On Fri, 2018-11-30 at 09:43 +0200, Kalle Valo wrote:
> Stephen Rothwell <sfr@canb.auug.org.au> writes:
> 
> > Hi Kalle,
> > 
> > On Fri, 30 Nov 2018 06:33:47 +0200 Kalle Valo <kvalo@codeaurora.org
> > > wrote:
> > > I take it that -Wimplict-fallthrough is not enabled by default
> > > yet? So
> > > Dave and Linus won't see these warnings?
> > 
> > Correct.
> > 
> > > What I'm planning is to send a pull request to Dave today and fix
> > > these
> > > warnings in the next pull request. Does that sound good?
> > 
> > That sounds fine.
> 
> Great, thanks for the confirmation. I'll then send the pull request
> today.

Just FYI, I enabled this by default in our internal tree so we will
notice when it happens before sending the patch upstream.

--
Cheers,
Luca.
