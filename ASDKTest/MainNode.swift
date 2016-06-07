//
//  MainNode.swift
//  ASDKTest
//
//  Created by Bartosz Górka on 03/06/16.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

enum CellType {
    case Simple
    case Description
    case DescriptionSM
    case DescriptionSMC1
    case DescriptionSMC2
    case DescriptionSMC3
    case DescriptionC1
    case DescriptionC2
    case DescriptionC3
    case C1
    case C2
    case C3
    case Buttons
}

class MainNode: ASCellNode {
    
    var cellType: CellType = .Simple
    
    var subNodes: [ASLayoutable] {
        switch cellType {
        case .Simple:
            return [firstNode, secondNode, imageNode, likeButtonsNode]
        case .Description:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode]
        case .DescriptionSM:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode]
        case .DescriptionSMC1:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .DescriptionSMC2:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .DescriptionSMC3:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .DescriptionC1:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .DescriptionC2:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .DescriptionC3:
            return [firstNode, secondNode, imageNode, likeButtonsNode, descriptionContainerNode, commentsNode, buttonsNode]
        case .C1:
            return [firstNode, secondNode, imageNode, likeButtonsNode, commentsNode, buttonsNode]
        case .C2:
            return [firstNode, secondNode, imageNode, likeButtonsNode, commentsNode, buttonsNode]
        case .C3:
            return [firstNode, secondNode, imageNode, likeButtonsNode, commentsNode, buttonsNode]
        case .Buttons:
            return [firstNode, secondNode, imageNode, likeButtonsNode, buttonsNode]
        }
    }
    
    var firstNode: ASDisplayNode
    var secondNode: ASDisplayNode
    var avatar: ASNetworkImageNode
    var imageNode: ASNetworkImageNode
    var likeButtonsNode: ASDisplayNode
    var descriptionContainerNode: ASDisplayNode
    var buttonsNode: ASDisplayNode
    var commentsNode: ASDisplayNode
    
    init(cellType: CellType) {
        firstNode = ASDisplayNode()
        secondNode = ASDisplayNode()
        avatar = ASNetworkImageNode()
        imageNode = ASNetworkImageNode()
        likeButtonsNode = ASDisplayNode()
        descriptionContainerNode = ASDisplayNode()
        buttonsNode = ASDisplayNode()
        commentsNode = ASDisplayNode()
        self.cellType = cellType
        
        super.init()
        
            
        firstNode.layerBacked = true
        
        secondNode.flexShrink = true
        secondNode.layerBacked = true
        
        imageNode.layerBacked = true

        avatar.layerBacked = true
        avatar.frame = CGRect(origin: .zero, size: CGSize(width: 60.0, height: 60.0))
        avatar.cornerRadius = 30.0

        likeButtonsNode.layerBacked = true
        
        addSubnode(firstNode)
        addSubnode(secondNode)
        addSubnode(imageNode)
        addSubnode(avatar)
        addSubnode(likeButtonsNode)
        addSubnode(descriptionContainerNode)
        addSubnode(buttonsNode)
        addSubnode(commentsNode)
        
        selectionStyle = .None
        
        dispatch_async(dispatch_get_main_queue()) { 
            self.secondNode.backgroundColor = .whiteColor()
            self.imageNode.backgroundColor = .darkGrayColor()
            self.avatar.backgroundColor = .darkGrayColor()
            self.likeButtonsNode.backgroundColor = .lightGrayColor()
            self.descriptionContainerNode.backgroundColor = .grayColor()
            self.buttonsNode.backgroundColor = .darkGrayColor()
            self.commentsNode.backgroundColor = .lightGrayColor()
            self.backgroundColor = UIColor(red: 240.0 / 255.0, green: 240.0 / 255.0, blue: 240.0 / 255.0, alpha: 1.0)
        }
    }
    
    override func layoutSpecThatFits(constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let maxWidth = constrainedSize.max.width
  
        firstNode.position = CGPoint(x: 20.0, y: 0.0)
        firstNode.preferredFrameSize = CGSize(width: maxWidth - 40.0, height: 42.0)
        firstNode.spacingBefore = 20.0
        secondNode.preferredFrameSize = CGSize(width: maxWidth, height: 62.0)
        imageNode.preferredFrameSize = CGSize(width: maxWidth, height: maxWidth)
        likeButtonsNode.preferredFrameSize = CGSize(width: maxWidth, height: 40.0)
        avatar.position = CGPoint(x: maxWidth / 2.0 , y: 62.0)
        descriptionContainerNode.preferredFrameSize = CGSize(width: maxWidth, height: 40.0)
        buttonsNode.preferredFrameSize = CGSize(width: maxWidth, height: 48.0)
        commentsNode.preferredFrameSize = CGSize(width: maxWidth, height: 40.0)
                
        let firstStack = ASStackLayoutSpec(direction: .Vertical, spacing: 0.0, justifyContent: .Start, alignItems: .Center, children: subNodes)
        firstStack.alignSelf = .Stretch
        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0.0, left: 8.0, bottom: 0.0, right: 8.0), child: firstStack)
        
        return insetSpec
    }
}
