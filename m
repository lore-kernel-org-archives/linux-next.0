From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: duplicate patches in the kspp and kbuild trees
Date: Tue, 14 Jun 2016 09:40:19 +1000
Message-ID: <20160614094019.14fac372@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@google.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Emese Revfy <re.emese@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi Kees,

As of today, there are four duplicate patches (different commits)
in the kspp and kbuild trees.

  Shared library support
  GCC plugin infrastructure
  Add Cyclomatic complexity GCC plugin
  Add sancov plugin

are in both trees as different commits :-(  They have been in the kbuild
tree for a couple of days already.  One of you should be merging the
other's branch, or you both should be mergeing a common branch.

Also, Kees, the versions in your tree do not have your Signed-off-by
(but do have Michal's).

-- 
Cheers,
Stephen Rothwell
