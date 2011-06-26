From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 0/2] finish modularization of ofpart parser
Date: Mon, 27 Jun 2011 01:02:58 +0400
Message-ID: <1309122180-12838-1-git-send-email-dbaryshkov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: linux-mtd-bounces@lists.infradead.org
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd@lists.infradead.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, dedekind1@gmail.com, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>
List-Id: linux-next.vger.kernel.org

To fix building of kernel if MTD is selected as a module and OF_PARTS
is selected, finish modularization of ofpart MTD partition parser.

The following changes since commit 81e49819e7d6c11c91702d6b4d9fc71255614488:

  mtd: spelling, capitalization, uniformity (2011-06-24 22:58:01 +0300)

are available in the git repository at:
  git://git.infradead.org/users/dbaryshkov/mtd-cleanup.git mtd-big-cleanup

Dmitry Eremin-Solenikov (2):
      mtd: make ofpart buildable as a separate module
      mtd/ofpart: add ofoldpart alias

 drivers/mtd/Kconfig  |    3 ++-
 drivers/mtd/Makefile |    2 +-
 drivers/mtd/ofpart.c |    3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
