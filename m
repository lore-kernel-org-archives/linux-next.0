From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
Subject: [PATCH 0/2] Tentative fix for the divide-by-zero on score/paris/..
Date: Wed, 15 Apr 2015 10:54:36 +0200
Message-ID: <1429088078-23827-1-git-send-email-quentin.casasnovas@oracle.com>
References: <20150414165000.GA19434@roeck-us.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150414165000.GA19434@roeck-us.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Rusty Russell <rusty@rustcorp.com.au>, Guenter Roeck <linux@roeck-us.net>
Cc: lkml <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

The following two patches might (hopefully) fix the build breakage on score
and some other architectures.  I've checked the new __ex_table checker
still works on x86-64 with them (it still detects an entry pointing to
.altinstr_rplacement) and they should apply cleanly on top of Rusty's
module-next branch.

Thanks to Guenter for the bug analysis and sorry again for the breakage.

Let me know if this makes things better..

Quentin
