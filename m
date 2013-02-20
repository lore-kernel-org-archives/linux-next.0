From: Peter Jones <pjones@redhat.com>
Subject: linux-next: build warning after merge of the akpm tree
Date: Wed, 20 Feb 2013 09:37:00 -0500
Message-ID: <1361371021-583-1-git-send-email-pjones@redhat.com>
References: <20130220173414.fa4886355efd8f85d0d349f4@canb.auug.org.au>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130220173414.fa4886355efd8f85d0d349f4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Matt Fleming <matt.fleming@intel.com>, Jens Axboe <axboe@kernel.dk>, Stephen Warren <swarren@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Stephen,

The following email is an updated patch which should fix the warning you're
seeing on architectures where sizeof is unsigned int rather than unsigned
long.

This completely replaces the ef25bb0fa6e2 patch.  Andrew, if you'd prefer a
single-line fixup patch, I can send you that instead.
