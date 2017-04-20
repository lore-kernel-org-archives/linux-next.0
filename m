From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pm tree with the arm-soc tree
Date: Thu, 20 Apr 2017 10:34:27 +1000
Message-ID: <20170420103427.62fbf195@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37217 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S938492AbdDTAea (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Apr 2017 20:34:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, ARM <linux-arm-kernel@lists.infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Quentin Schulz <quentin.schulz@free-electrons.com>

Hi Rafael,

Today's linux-next merge of the pm tree got a conflict in:

  arch/arm/boot/dts/sun8i-a33.dtsi

between commits:

  66c373228dc4 ("ARM: sun8i: a33: Add the Mali OPPs")
  e6bd37627e92 ("ARM: sun8i: a33: add all operating points")

from the arm-soc tree and commit:

  d87bd1942058 ("PM / OPP: Use - instead of @ for DT entries")

from the pm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

I suspect that arch/arm/boot/dts/sun8i-a33-sinlinx-sina33.dts may need
some fixups as well.
-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm/boot/dts/sun8i-a33.dtsi
index 013978259372,a2c555d6475c..000000000000
--- a/arch/arm/boot/dts/sun8i-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a33.dtsi
@@@ -50,73 -49,19 +50,73 @@@
  		compatible = "operating-points-v2";
  		opp-shared;
  
- 		opp@120000000 {
++		opp-120000000 {
 +			opp-hz = /bits/ 64 <120000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@240000000 {
++		opp-240000000 {
 +			opp-hz = /bits/ 64 <240000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@312000000 {
++		opp-312000000 {
 +			opp-hz = /bits/ 64 <312000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@408000000 {
++		opp-408000000 {
 +			opp-hz = /bits/ 64 <408000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@480000000 {
++		opp-480000000 {
 +			opp-hz = /bits/ 64 <480000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@504000000 {
++		opp-504000000 {
 +			opp-hz = /bits/ 64 <504000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@600000000 {
++		opp-600000000 {
 +			opp-hz = /bits/ 64 <600000000>;
 +			opp-microvolt = <1040000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@648000000 {
+ 		opp-648000000 {
  			opp-hz = /bits/ 64 <648000000>;
  			opp-microvolt = <1040000>;
  			clock-latency-ns = <244144>; /* 8 32k periods */
  		};
  
- 		opp@720000000 {
++		opp-720000000 {
 +			opp-hz = /bits/ 64 <720000000>;
 +			opp-microvolt = <1100000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@816000000 {
+ 		opp-816000000 {
  			opp-hz = /bits/ 64 <816000000>;
  			opp-microvolt = <1100000>;
  			clock-latency-ns = <244144>; /* 8 32k periods */
  		};
  
- 		opp@912000000 {
++		opp-912000000 {
 +			opp-hz = /bits/ 64 <912000000>;
 +			opp-microvolt = <1200000>;
 +			clock-latency-ns = <244144>; /* 8 32k periods */
 +		};
 +
- 		opp@1008000000 {
+ 		opp-1008000000 {
  			opp-hz = /bits/ 64 <1008000000>;
  			opp-microvolt = <1200000>;
  			clock-latency-ns = <244144>; /* 8 32k periods */
@@@ -156,27 -100,6 +156,27 @@@
  		status = "disabled";
  	};
  
 +	iio-hwmon {
 +		compatible = "iio-hwmon";
 +		io-channels = <&ths>;
 +	};
 +
 +	mali_opp_table: gpu-opp-table {
 +		compatible = "operating-points-v2";
 +
- 		opp@144000000 {
++		opp-144000000 {
 +			opp-hz = /bits/ 64 <144000000>;
 +		};
 +
- 		opp@240000000 {
++		opp-240000000 {
 +			opp-hz = /bits/ 64 <240000000>;
 +		};
 +
- 		opp@384000000 {
++		opp-384000000 {
 +			opp-hz = /bits/ 64 <384000000>;
 +		};
 +	};
 +
  	memory {
  		reg = <0x40000000 0x80000000>;
  	};
