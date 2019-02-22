From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: build failure after merge of the rpmsg tree
Date: Fri, 22 Feb 2019 13:50:46 +0100
Message-ID: <20190222125046.GB29125@lst.de>
References: <20190222161817.32e35462@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190222161817.32e35462@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Christoph Hellwig <hch@lst.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Loic Pallardy <loic.pallardy@st.com>
List-Id: linux-next.vger.kernel.org

FYI, can I please get an explanation for the remoteproc changes?

We really should avoid adding new callers of dma_declare_coherent_memory,
which is a rather badly designed interface.
