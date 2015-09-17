From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the libata tree
Date: Thu, 17 Sep 2015 14:03:36 +1000
Message-ID: <20150917140336.63c2d09c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Luis de Bethencourt <luis@debethencourt.com>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the libata tree, today's linux-next build (powercp
allmodconfig) failed like this:

drivers/ata/pata_macio.c:1347:1: error: 'pata_macio_patch' undeclared here (not in a function)
drivers/ata/pata_macio.c:1347:1: error: '__mod_of__pata_macio_patch_device_table' aliased to undefined symbol 'pata_macio_patch'

Caused by commit

  5d8619769cf5 ("ata: pata_macio: Fix module autoload for OF platform driver")

A simple typo ("patch" v "match"), but clearly never build tested.

Only found after the release.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
