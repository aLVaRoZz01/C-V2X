//
// Copyright (C) 2006-2011 Christoph Sommer <christoph.sommer@uibk.ac.at>
//
// Documentation for these modules is at http://veins.car2x.org/
//
// SPDX-License-Identifier: GPL-2.0-or-later
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//

// isoto: Navigator application for simu5g, .ned+.cc+.h
// First version (2023-02-17): Reads data, sends commands each time the vehicle moves. No communications.  

package simu5g.apps.navigator;
import inet.applications.contract.IApp;



simple Navigator  like IApp
{
    parameters:
    	@class(Navigator);
    	
        //double sampling_time @unit("s") = default(0.02s);
    	@display("i=block/app2");
   gates:
        output socketOut;
        input socketIn;
}
