From: "Justin P. Mattock" <justinmattock@gmail.com>
Subject: Re: linux-next: manual merge of the trivial tree with the wireless
 tree
Date: Mon, 11 Apr 2011 08:15:44 -0700
Message-ID: <4DA31B20.1010205@gmail.com>
References: <20110411132844.fa651c08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:44467 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754184Ab1DKPQC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Apr 2011 11:16:02 -0400
In-Reply-To: <20110411132844.fa651c08.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jiri Kosina <jkosina@suse.cz>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>, "John W. Linville" <linville@tuxdriver.com>

On 04/10/2011 08:28 PM, Stephen Rothwell wrote:
> Hi Jiri,
>
> Today's linux-next merge of the trivial tree got a conflict in
> drivers/net/wireless/ath/ath9k/phy.h between commit a9b6b2569cf1
> ("ath9k_hw: turn a few big macros into functions") from the wireless tree
> and commit 6eab04a87677 ("treewide: remove extra semicolons") from the
> trivial tree.
>
> The former commit removed the code that the latter changed, so I did that.

yikes... I dont like seeing that.. what can I do to help with this?

Justin P. Mattock
