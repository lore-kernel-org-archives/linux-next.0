From: Anders Larsen <al@alarsen.net>
Subject: Re: linux-next: manual merge of the arm tree with the arm-current
 tree
Date: Mon, 11 Oct 2010 09:48:36 +0200
Message-ID: <1286783316l.6006l.0l@i-dmzi_al.realan.de>
References: <20101011122441.606a0643.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20101011122441.606a0643.sfr@canb.auug.org.au> (from
	sfr@canb.auug.org.au on Mon Oct 11 03:24:41 2010)
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Russell King <rmk@arm.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Ungerer <gerg@snapgear.com>
List-Id: linux-next.vger.kernel.org

On 2010-10-11 03:24:41, Stephen Rothwell wrote:
> Today's linux-next merge of the arm tree got a conflict in
> arch/arm/mach-at91/include/mach/system.h between commit
> 5c189208b606a85b4e97109af70d59f10a42fdfd ("ARM: 6436/1: AT91: Fix
> power-saving in idle-mode on 926T processors") from the arm-current tree
> and commit cb809b1a5ebffca8cf0314b788919989e8e4ab5f ("AT91: fix use of
> clock disable on idle for AT91x40 devices") from the arm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary.

Acked-by: Anders Larsen <al@alarsen.net>

Thanks
Anders		(Author of "...6436/1...")
