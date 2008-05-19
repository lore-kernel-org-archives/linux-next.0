From: Jean Delvare <khali@linux-fr.org>
Subject: Re: linux-next: i2c merge conflict
Date: Mon, 19 May 2008 09:37:06 +0200
Message-ID: <20080519093706.50ef0c63@hyperion.delvare>
References: <20080519130235.ce392f62.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from zone0.gcu-squad.org ([212.85.147.21]:2056 "EHLO
	services.gcu-squad.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753502AbYESHhQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 19 May 2008 03:37:16 -0400
In-Reply-To: <20080519130235.ce392f62.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 19 May 2008 13:02:35 +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the i2c tree got a trivial conflict in
> drivers/i2c/busses/i2c-nforce2.c because "i2c-nforce2: Disable the second
> SMBus channel on the DFI Lanparty NF4 Expert" appeasr in both the i2c
> tree and Linus' tree.  I assume that this will go away tomorrow when the
> i2c tree gets resynced.

Correct. There are more than just this one patch in this case, BTW. I
will resync the i2c tree in the next hour and then everything should
apply again without conflicts. 

-- 
Jean Delvare
