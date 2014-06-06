From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] amd-xgbe: Remove unnecessary include
Date: Fri, 06 Jun 2014 13:11:07 -0700 (PDT)
Message-ID: <20140606.131107.70145995747531058.davem@davemloft.net>
References: <20140606135219.32017.96806.stgit@tlendack-t1.amdoffice.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20140606135219.32017.96806.stgit@tlendack-t1.amdoffice.net>
Sender: netdev-owner@vger.kernel.org
To: thomas.lendacky@amd.com
Cc: netdev@vger.kernel.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

From: Tom Lendacky <thomas.lendacky@amd.com>
Date: Fri, 6 Jun 2014 08:52:19 -0500

> The include of asm/cputype.h breaks the powerpc build. This
> include was accidentally left in from driver debugging and
> can be removed.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>

Since Stephen Rothwell reported this problem to you, you should
give him credit for this using the "Reported-by: " tag.

I took care of it this time, but you must do this in the future.
