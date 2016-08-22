From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: please clean up the thermal-soc tree
Date: Mon, 22 Aug 2016 11:43:46 +1000
Message-ID: <20160822114346.4cb45ec5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
List-Id: linux-next.vger.kernel.org

Hi Eduardo,

The thermal-soc tree now shares quite a few patches (but not commits)
with the thermal tree.  These are causing a few unnecessary conflicts,
so please clean it up.

-- 
Cheers,
Stephen Rothwell
