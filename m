From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: linux-next: manual merge of the bkl-config tree with the tty tree
Date: Wed, 2 Mar 2011 00:16:53 +0100
Message-ID: <201103020016.53993.arnd@arndb.de>
References: <20110228174007.b6faf01e.sfr@canb.auug.org.au> <201103012324.27725.arnd@arndb.de> <20110302101357.7d2a3d81.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110302101357.7d2a3d81.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>
List-Id: linux-next.vger.kernel.org

On Wednesday 02 March 2011 00:13:57 Stephen Rothwell wrote:
> On Tue, 1 Mar 2011 23:24:27 +0100 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > I have cleared the branch in my repository now, since the contents
> > were very outdated. I have a newer branch named 'final' with all the patches
> > that are needed on top of -next to kill the BKL for good.
> 
> Thanks for that.
>
> > I'll send the patches out for review again and if everyone is happy,
> > I can update the config branch so they get into -next.

Small update: I've added part of the series to the config branch
already, just the patches that already have Acked-by:s from the
maintainers, but no other tree to go through.
 
> So can I remove the bkl-trivial, bkl-llseek and bkl-vfs trees?

Yes.

	Arnd
