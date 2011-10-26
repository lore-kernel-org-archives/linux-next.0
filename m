From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: linux-next: Tree for Oct 25 (pci/ats.c)
Date: Wed, 26 Oct 2011 11:37:07 -0700
Message-ID: <4EA85353.4060101@xenotime.net>
References: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20111025203628.40a1b8a475e32053aa34dabe@canb.auug.org.au>
Sender: linux-pci-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Linus <torvalds@linux-foundation.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Joerg Roedel <joerg.roedel@amd.com>, Yu Zhao <yu.zhao@intel.com>
List-Id: linux-next.vger.kernel.org

On 10/25/11 02:36, Stephen Rothwell wrote:
> Hi all,


When CONFIG_PCI_IOV is not enabled:
(probably because PCI_PRI selects PCI_ATS even when PCI_IOV is not
enabled)

drivers/pci/ats.c:37:5: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:44:11: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:45:5: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:55:5: error: redefinition of 'pci_enable_ats'
drivers/pci/ats.c:60:2: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:60:2: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:66:52: error: 'struct pci_dev' has no member named 'physfn'
drivers/pci/ats.c:68:3: error: 'struct pci_dev' has no member named 'sriov'
drivers/pci/ats.c:69:11: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:70:13: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:75:8: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:76:21: error: 'struct pci_dev' has no member named 'sriov'
drivers/pci/ats.c:90:32: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:92:5: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:102:6: error: redefinition of 'pci_disable_ats'
drivers/pci/ats.c:106:2: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:106:2: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:108:31: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:110:32: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:112:5: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:115:52: error: 'struct pci_dev' has no member named 'physfn'
drivers/pci/ats.c:117:3: error: 'struct pci_dev' has no member named 'sriov'
drivers/pci/ats.c:118:7: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:119:12: error: 'struct pci_dev' has no member named 'ats'
drivers/pci/ats.c:121:21: error: 'struct pci_dev' has no member named 'sriov'
drivers/pci/ats.c:141:5: error: redefinition of 'pci_ats_queue_depth'
drivers/pci/ats.c:149:9: error: 'struct pci_dev' has no member named 'ats'
next-2011-1025/drivers/pci/ats.c:150:13: error: 'struct pci_dev' has no member named 'ats'



Looks like ats.c also needs to #include <linux/export.h>:

drivers/pci/ats.c:96:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:127:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:161:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:194:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:215:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:236:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:264:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:295:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]
drivers/pci/ats.c:325:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL' [-Wimplicit-int]

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
