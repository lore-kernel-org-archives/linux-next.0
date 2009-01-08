From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 4/4] i2400m/usb: wrap USB power saving in #ifdef
 CONFIG_PM
Date: Thu, 08 Jan 2009 11:08:35 -0800 (PST)
Message-ID: <20090108.110835.109199764.davem@davemloft.net>
References: <cover.1231355768.git.inaky@linux.intel.com>
	<0e511f3772ac9887551bec34ee682fa5bf63fb69.1231355768.git.inaky@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <0e511f3772ac9887551bec34ee682fa5bf63fb69.1231355768.git.inaky@linux.intel.com>
Sender: netdev-owner@vger.kernel.org
To: inaky@linux.intel.com
Cc: netdev@vger.kernel.org, wimax@linuxwimax.org, greg@kroah.com, randy.dunlap@oracle.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wimax@intel.com
List-Id: linux-next.vger.kernel.org

From: Inaky Perez-Gonzalez <inaky@linux.intel.com>
Date: Wed,  7 Jan 2009 11:22:22 -0800

> Current code was assuming PM was always enabled, which is not
> correct. Code which accesses members in the struct usb_device that are
> dependant on CONFIG_PM must be protected the same.
> 
> Reported by Randy Dunlap from a build error in the linux-next tree on
> 07/01/2009.
> 
> Signed-off-by: Inaky Perez-Gonzalez <inaky@linux.intel.com>

Also applied, thanks a lot.
