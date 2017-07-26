From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: missing Signed-off-by in commit in the drm tree
Date: Thu, 27 Jul 2017 09:24:20 +1000
Message-ID: <20170727092420.52eff20b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Philippe CORNU <philippe.cornu@st.com>, Archit Taneja <architt@codeaurora.org>, Eric Anholt <eric@anholt.net>
List-Id: linux-next.vger.kernel.org

Hi all,

Commit

  cea3a330ee20 ("drm/stm: ltdc: Fix leak of px clk enable in some error paths")

is missing a Signed-off-by for its author.

-- 
Cheers,
Stephen Rothwell
