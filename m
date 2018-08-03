From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: Re: [PATCH] mt76x0: build driver only as module
Date: Fri, 3 Aug 2018 12:09:40 +0200
Message-ID: <20180803100939.GE10284@redhat.com>
References: <20180803091401.GB10284@redhat.com>
 <87zhy36c4n.fsf@kamboji.qca.qualcomm.com>
 <20180803092822.GD10284@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180803092822.GD10284@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Wireless <linux-wireless@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Aug 03, 2018 at 11:28:22AM +0200, Stanislaw Gruszka wrote:
> > But this feels like an ugly hack to me. Isn't there a better way to fix
> > this? (I don't have time to investigate the error in detail right now.)
> 
> Yes, rename symbols names. And I will do this, just wanted to provide
> quick fix for the problem. 
> 
> Moreover seems the same thing should be done for mt7601u to avoid build
> errors and perhaps with mt76 :-( 
> 
> So I'm going to rename functions.

I have the patches, I'm building kernel with allyesconfig now,
it will take a while ...

Stanislaw
