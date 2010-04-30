From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for April 30 (CONFIG_SYSFS=n)
Date: Fri, 30 Apr 2010 10:50:16 -0700
Message-ID: <20100430105016.40b51636.randy.dunlap@oracle.com>
References: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100430163538.7253a9e0.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Eric Biederman <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, gregkh@suse.de
List-Id: linux-next.vger.kernel.org

On Fri, 30 Apr 2010 16:35:38 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100429:


When CONFIG_SYSFS is disabled:

include/linux/sysfs.h:330: error: parameter 1 ('type') has incomplete type

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
