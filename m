From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 11 (net/ethernet/intel/i40e)
Date: Mon, 11 Aug 2014 09:17:45 -0700
Message-ID: <53E8ECA9.6060806@infradead.org>
References: <20140811155213.0aa083ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:59475 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751402AbaHKQRq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 11 Aug 2014 12:17:46 -0400
In-Reply-To: <20140811155213.0aa083ce@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, e1000-devel@lists.sourceforge.net, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux.nics@intel.com

On 08/10/14 22:52, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add code intended for v3.18 until after v3.17-rc1 is
> released.
> 
> Changes since 20140808:
> 

on i386 and x86_64:

../drivers/net/ethernet/intel/i40e/i40e_fcoe.c: In function 'i40e_get_fcoe_tc_map':
../drivers/net/ethernet/intel/i40e/i40e_fcoe.c:354:23: error: 'IEEE_8021QAZ_APP_SEL_ETHERTYPE' undeclared (first use in this function)
   if (app.selector == IEEE_8021QAZ_APP_SEL_ETHERTYPE &&


Needs to #include <uapi/linux/dcbnl.h> ??


-- 
~Randy
