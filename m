From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: [PATCH v2 0/6] test_sysctl: fix up merge conflicts
Date: Fri, 30 Jun 2017 15:44:25 -0700
Message-ID: <20170630224431.17374-1-mcgrof@kernel.org>
References: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752967AbdF3Woe (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Jun 2017 18:44:34 -0400
In-Reply-To: <20170629123527.2196820e70818aeab51338e5@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: keescook@chromium.org, shuahkh@osg.samsung.com, shuah@kernel.org, sfr@canb.auug.org.au, orson.zhai@linaro.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>

Andrew,

as requested, this addresses the merge conflict present on kselftest/next on
linux-next. The merge conflict was caused by Orson Zhai's patch titled,
"tools/testing/selftests/sysctl: Add pre-check to the value of writes_strict"
and my changes which shuffled the script around. I've made Orson's check a
function, and integrated his exit strategy to restore the production sysctl
writes_strict setting. To do this I've also added a PROD_SYCTL, which now users
can also override through an environment variable.

These changes are also present on my linux-next 20170630-test-sysctl branch
based on linux-next next20170630 [0]. If there are any questionms please let me
know.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20170630-test-sysctl

  Luis

Luis R. Rodriguez (6):
  test_sysctl: add dedicated proc sysctl test driver
  test_sysctl: add generic script to expand on tests
  test_sysctl: test against PAGE_SIZE for int
  test_sysctl: add simple proc_dointvec() case
  test_sysctl: add simple proc_douintvec() case
  test_sysctl: test against int proc_dointvec() array support

 lib/Kconfig.debug                               |  11 +
 lib/Makefile                                    |   1 +
 lib/test_sysctl.c                               | 148 +++++
 tools/testing/selftests/sysctl/Makefile         |   3 +-
 tools/testing/selftests/sysctl/common_tests     | 131 ----
 tools/testing/selftests/sysctl/config           |   1 +
 tools/testing/selftests/sysctl/run_numerictests |  10 -
 tools/testing/selftests/sysctl/run_stringtests  |  77 ---
 tools/testing/selftests/sysctl/sysctl.sh        | 774 ++++++++++++++++++++++++
 9 files changed, 936 insertions(+), 220 deletions(-)
 create mode 100644 lib/test_sysctl.c
 delete mode 100644 tools/testing/selftests/sysctl/common_tests
 create mode 100644 tools/testing/selftests/sysctl/config
 delete mode 100755 tools/testing/selftests/sysctl/run_numerictests
 delete mode 100755 tools/testing/selftests/sysctl/run_stringtests
 create mode 100755 tools/testing/selftests/sysctl/sysctl.sh

-- 
2.11.0
