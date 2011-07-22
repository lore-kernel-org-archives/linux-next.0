From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for July 22 (bcma)
Date: Fri, 22 Jul 2011 09:04:14 -0700
Message-ID: <20110722090414.4e3d80a5.rdunlap@xenotime.net>
References: <20110722164237.2b3f6cbdedafa9e1d3f70867@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110722164237.2b3f6cbdedafa9e1d3f70867@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, zajec5@gmail.com, linux-wireless@vger.kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, 22 Jul 2011 16:42:37 +1000 Stephen Rothwell wrote:

> Hi all,

(similar to a report from July 16:)

linux-next-20110722/drivers/bcma/driver_pci.c:175: error: 'SSB_PCICORE_BFL_NOPCI' undeclared (first use in this function)

This build error happens whether CONFIG_PCI is enabled or disabled (unlike
what I stated on July 16).

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
