From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: next/master boot: 179 boots: 11 failed, 167 passed with 1
 offline (next-20180731)
Date: Wed, 1 Aug 2018 13:50:27 -0700
Message-ID: <20180801205027.GC24465@builder>
References: <5b607cc4.1c69fb81.6c1d6.6534@mx.google.com>
 <20180731161114.GI5719@sirena.org.uk>
 <20180731195037.GA6737@centauri.lan>
 <20180801093102.GB5509@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180801093102.GB5509@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: David Brown <david.brown@linaro.org>, kernel-build-reports@lists.linaro.org, linux-arm-msm@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, linux-next@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-next.vger.kernel.org

On Wed 01 Aug 02:31 PDT 2018, Mark Brown wrote:

> On Tue, Jul 31, 2018 at 09:50:37PM +0200, Niklas Cassel wrote:
> 
> > I guess it could be a bug that does not trigger on every boot,
> > or it could be a problem in the kernelci infrastructure.
> 
> Infrastructure bugs *tend* to manifest differently to this FWIW, though
> it can never be excluded.

No, that's not an infrastructure issue.

The board did warn about not finding the ath10k firmware, which is
always does, so that's not the issue - in itself. Then nothing happened
for 266 seconds, so my lab decided to terminate the agony.

So this is either an issue with the stability of next-20180731 or with
the specific board.


PS. Today's next did boot successfully on the board.

Regards,
Bjorn
