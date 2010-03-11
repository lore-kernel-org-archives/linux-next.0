From: Bruno Randolf <br1@einfach.org>
Subject: Re: linux-next: manual merge of the wireless tree with the wireless-current tree
Date: Thu, 11 Mar 2010 11:38:11 +0900
Message-ID: <201003111138.12070.br1@einfach.org>
References: <20100311131500.1057b6c5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100311131500.1057b6c5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thursday 11 March 2010 11:15:00 Stephen Rothwell wrote:
> Hi John,
> 
> Today's linux-next merge of the wireless tree got a conflict in
> drivers/net/wireless/ath/ath5k/phy.c between commit
> 86415d43efd4f7093979cfa8a80232114266f1a4 ("ath5k: fix I/Q calibration
> (for real)") from the wireless-current tree and commit
> 49a85d211a63ad1d565842ebc535c5168d85d86a ("ath5k: IQ calibration for
> AR5211 is slightly different") from the wireless tree.
> 
> I fixed it up (I think - see below) and can carry the fix for a while.

not sure what happened...

but wireless-next-2.6.git 86415d43efd4f7093979cfa8a80232114266f1a4 is an older 
version of my patch. i have sent one which applies cleanly later on.

your fix is correct, though.

bruno
