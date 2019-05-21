From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
Date: Tue, 21 May 2019 09:31:07 -0600
Message-ID: <20190521093107.79790d12@lwn.net>
References: <20190521074435.7a277fd6@canb.auug.org.au>
        <20190520155423.2ad5d16a@lwn.net>
        <2143236.hFqxAeOdFG@bentobox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2143236.hFqxAeOdFG@bentobox>
Sender: linux-kernel-owner@vger.kernel.org
To: Sven Eckelmann <sven@narfation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 21 May 2019 09:18:21 +0200
Sven Eckelmann <sven@narfation.org> wrote:

> On Monday, 20 May 2019 23:54:23 CEST Jonathan Corbet wrote:
> [...]
> > Argh, sorry, I should have caught that.  Fixed, thanks.  
> 
> Thanks for trying. Unfortunately it was changed to the wrong value. The actual 
> commit I wanted to reference in both places of the commit message was:
> 
>     8ea8814fcdcb ("LICENSES: Clearly mark dual license only licenses")
> 
> It seems I've copied the wrong commit id for some reason when I send it though 
> the git-fixes alias and it didn't occur to me that I just referenced my own 
> patch. Sorry about the confusion.

<sigh>

We want those tags to be right.  I'm going to fix this and force-push,
hopefully nobody will get too made at me...

jon
