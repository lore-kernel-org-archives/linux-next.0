From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: ia64 won't boot because of rcu_sched self-detected stall
Date: Thu, 23 Aug 2012 19:54:37 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F19397175@ORSMSX104.amr.corp.intel.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
 <20120821232038.GV2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19396504@ORSMSX104.amr.corp.intel.com>
 <20120822004608.GW2456@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:12567 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759238Ab2HWTyj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Aug 2012 15:54:39 -0400
In-Reply-To: <20120822004608.GW2456@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "paulmck@linux.vnet.ibm.com" <paulmck@linux.vnet.ibm.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "fweisbec@gmail.com" <fweisbec@gmail.com>

> Without the calls to rcu_idle_enter() and rcu_idle_exit(), RCU has no
> way of knowing that the CPU is idle, so waits forever for a context
> switch.

Adding the calls at the places you suggested solves the problem. Thanks.

Which tree is feeding these changes to linux-next? How do I get
this ia64 fix into that tree so it will go to Linus in the same merge
that the changes that required this will be in?

Do you want me to create a patch (I can do that, but I'm not sure
that I can write a good commit message). If someone else does,
then it can be marked:

Tested-by: Tony Luck <tony.luck@intel.com>

-Tony
