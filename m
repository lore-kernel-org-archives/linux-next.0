From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the dt-rh tree
Date: Mon, 7 Mar 2016 18:57:38 +1100
Message-ID: <20160307185738.59a9d21b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46471 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752046AbcCGH5k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 7 Mar 2016 02:57:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rob Herring <robherring2@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Rob,

After merging the dt-rh tree, today's linux-next build (powerpc allyesconfig)
produced these warnings:

Warning (unit_address_vs_reg): Node /testcase-data/interrupts/interrupts-extended0 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest100 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest101 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest0 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest1 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest2 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest3 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest5 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest6 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest7 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/test-unittest8 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/i2c-test-bus has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest12 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest13 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest14 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay-node/test-bus/i2c-test-bus/test-unittest14/i2c@0/test-mux-dev has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay0/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay1/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay2/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay3/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay4/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay4/fragment@0/__overlay__/test-unittest4 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay5/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay6/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay7/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay8/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay9/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay10/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay10/fragment@0/__overlay__/test-unittest10 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay10/fragment@0/__overlay__/test-unittest10/test-unittest101 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay11/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay11/fragment@0/__overlay__/test-unittest11 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay11/fragment@0/__overlay__/test-unittest11/test-unittest111 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay12/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay13/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay15/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /testcase-data/overlay15/fragment@0/__overlay__/test-unittest15 has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /testcase-data/overlay15/fragment@0/__overlay__/test-unittest15/i2c@0/test-mux-dev has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): Node /__local_fixups__/testcase-data/overlay2/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /__local_fixups__/testcase-data/overlay3/fragment@0 has a unit name, but no reg property
Warning (unit_address_vs_reg): Node /__local_fixups__/testcase-data/overlay4/fragment@0 has a unit name, but no reg property

Introduced by commit

  fa38a82096a1 ("scripts/dtc: Update to upstream version 53bf130b1cdd")

-- 
Cheers,
Stephen Rothwell
