From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: linux-next: Tree for May 6 (acpi: PM=n)
Date: Thu, 6 May 2010 08:05:38 -0700
Message-ID: <20100506080538.b566f50e.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Sender: linux-acpi-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-pm@lists.linux-foundation.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-acpi@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Thu, 6 May 2010 15:15:02 +1000 Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20100505:


When CONFIG_PM is not set:

drivers/built-in.o: In function `acpi_init':
bus.c:(.init.text+0x2d84): undefined reference to `pm_flags'
bus.c:(.init.text+0x2d91): undefined reference to `pm_flags'

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
