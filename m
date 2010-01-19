From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the mips tree
Date: Tue, 19 Jan 2010 12:59:35 -0800
Message-ID: <20100119205935.GB10928@kroah.com>
References: <20100118185351.3c6b719f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1755855Ab0ASVSt@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20100118185351.3c6b719f.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wu Zhangjin <wuzhangjin@gmail.com>, Ralf Baechle <ralf@linux-mips.org>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 18, 2010 at 06:53:51PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/sm7xx/smtc2d.c drivers/staging/sm7xx/smtc2d.h between
> commit 8cdfa0e5f204ee97d27f742ebd207f4de8ca2984 ("Loongson: Change the
> Email address of Wu Zhangjin") from the mips tree and commit
> 1467bbc532da8c044e57706db232efe616ae5b00 ("staging: sm7xx: remove the
> buggy 2D acceleration support") from the staging tree.
> 
> I just removed the 2 files (as was done in the staging tree).

Thanks, that's the correct patch.

greg k-h
