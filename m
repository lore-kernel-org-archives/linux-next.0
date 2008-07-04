From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: linux-next: Tree for July 4
Date: Fri, 4 Jul 2008 11:46:48 +0100
Message-ID: <20080704114648.13374869@lxorguk.ukuu.org.uk>
References: <20080704195529.7f56e768.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753857AbYGDLEh@vger.kernel.org>
In-Reply-To: <20080704195529.7f56e768.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

> 	ttydev: fix pamc_zilog for tty pointer move
> 	ttydev: sparc fix for tty move
> 	ttydev: sparc32 fix for tty move
> 	atmel_serial: Fix tty_port breakage

Got these

> http://www.kernel.org/pub/linux/kernel/people/sfr/linux-next/).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" as mentioned in the FAQ on the wiki
> (see below).

bash-3.2$ git fetch linux-next
remote: error: refs/heads/history does not point to a valid object!
remote: error: refs/heads/master does not point to a valid object!
remote: error: refs/tags/next-20080704 does not point to a valid object!

(on top of a clean current Linus git pull)
