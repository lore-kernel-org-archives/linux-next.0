From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for August 4 (olpc_battery)
Date: Wed, 4 Aug 2010 09:47:55 -0700
Message-ID: <20100804094755.e0377eb0.randy.dunlap@oracle.com>
References: <20100804151035.14678528.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100804151035.14678528.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, 4 Aug 2010 15:10:35 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> As the merge window is open, please do not add 2.6.27 material to your
> linux-next included trees until after 2.6.36-rc1.
> 
> Changes since 20100803:


drivers/power/olpc_battery.c:387: error: unknown field 'owner' specified in initializer
drivers/power/olpc_battery.c:387: warning: excess elements in struct initializer
drivers/power/olpc_battery.c:387: warning: (near initialization for 'olpc_bat_eeprom.attr')


The .owner field has been dropped from the attr struct.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
