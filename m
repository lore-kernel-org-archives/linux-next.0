From: Thierry Reding <thierry.reding@gmail.com>
Subject: linux-next: build failure after merge of the mips tree
Date: Mon,  7 Oct 2013 17:18:44 +0200
Message-ID: <1381159127-11067-2-git-send-email-treding@nvidia.com>
References: <1381159127-11067-1-git-send-email-treding@nvidia.com>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <1381159127-11067-1-git-send-email-treding@nvidia.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Greg Ungerer <gerg@snapgear.com>, Ralf Baechle <ralf@linux-mips.org>, Ashok Kumar <ashoks@broadcom.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org
List-Id: linux-next.vger.kernel.org

Today's linux-next merge fails to build on various default configuration
builds. This seems to be caused by the following commit:

	5395d97 MIPS: Fix start of free memory when using initrd

Looking at the patchwork URLs in that commit message, Greg's original
patch seems to have been fine, but Ashok's patch uses the initrd_end
symbol outside of the section protected by an CONFIG_BLK_DEV_INITRD
#ifdef and therefore causes to fail during linking.

I've reverted the patch in today's linux-next tree.

Thierry
